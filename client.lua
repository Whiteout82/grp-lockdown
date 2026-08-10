local Active = {}

local function jobAllowed(jobs)
    local data = exports.qbx_core:GetPlayerData()
    local job = data and data.job
    if not job then return false end

    local allowed = (jobs or Config.Jobs)[job.name]
    if allowed == nil then return false end

    local grade = type(job.grade) == 'table' and job.grade.level or job.grade
    return (tonumber(grade) or 0) >= allowed
end

RegisterNetEvent('grp-lockdown:state', function(id, state)
    Active[id] = state or nil
end)

CreateThread(function()
    TriggerServerEvent('grp-lockdown:sync')

    for i, v in ipairs(Config.Locations) do
        exports.ox_target:addBoxZone({
            coords = v.coords,
            size = v.size or Config.Size,
            rotation = v.rotation or 0.0,
            options = {
                {
                    name = ('grp_lockdown_%s'):format(i),
                    icon = 'fa-solid fa-lock',
                    label = 'Activate Shutter Lockdown',
                    distance = v.distance or Config.Distance,
                    canInteract = function()
                        return jobAllowed(v.jobs)
                            and not Active[v.shutter]
                            and not exports.samy_shutters:IsShutterMoving(v.shutter)
                            and exports.samy_shutters:IsShutterOpen(v.shutter)
                    end,
                    onSelect = function()
                        TriggerServerEvent('grp-lockdown:start', i)
                    end
                },
                {
                    name = ('grp_open_%s'):format(i),
                    icon = 'fa-solid fa-lock-open',
                    label = 'Open Shutter',
                    distance = v.distance or Config.Distance,
                    canInteract = function()
                        return jobAllowed(v.jobs)
                            and not exports.samy_shutters:IsShutterMoving(v.shutter)
                            and not exports.samy_shutters:IsShutterOpen(v.shutter)
                    end,
                    onSelect = function()
                        TriggerServerEvent('grp-lockdown:open', i)
                    end
                }
            }
        })
    end
end)
