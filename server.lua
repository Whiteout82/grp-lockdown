local Active, Tokens = {}, {}

local function getLocation(index)
    return Config.Locations[tonumber(index)]
end

local function jobAllowed(src, jobs)
    local player = exports.qbx_core:GetPlayer(src)
    local job = player and player.PlayerData and player.PlayerData.job
    if not job then return false end

    local allowed = (jobs or Config.Jobs)[job.name]
    if allowed == nil then return false end

    local grade = type(job.grade) == 'table' and job.grade.level or job.grade
    return (tonumber(grade) or 0) >= allowed
end

local function nearTarget(src, coords)
    local ped = GetPlayerPed(src)
    if ped == 0 then return false end
    return #(GetEntityCoords(ped) - coords) <= Config.ServerDistance
end

local function toggle(id, speed)
    TriggerEvent('samy_shutters:server:ToggleShutter', id, speed or Config.Speed)
end

local function setState(id, state)
    Active[id] = state or nil
    TriggerClientEvent('grp-lockdown:state', -1, id, state)
end

RegisterNetEvent('grp-lockdown:sync', function()
    for id in pairs(Active) do
        TriggerClientEvent('grp-lockdown:state', source, id, true)
    end
end)

RegisterNetEvent('grp-lockdown:start', function(index)
    local src = source
    local v = getLocation(index)

    if not v
        or not nearTarget(src, v.coords)
        or not jobAllowed(src, v.jobs)
        or Active[v.shutter]
    then return end

    local id = v.shutter
    Tokens[id] = (Tokens[id] or 0) + 1
    local token = Tokens[id]

    setState(id, true)

    if exports.samy_shutters:IsShutterOpen(id) then
        toggle(id, v.speed)
    end

    SetTimeout((v.time or Config.LockdownTime) * 60000, function()
        if Active[id] and Tokens[id] == token then
            setState(id, false)
        end
    end)
end)

RegisterNetEvent('grp-lockdown:open', function(index)
    local src = source
    local v = getLocation(index)

    if not v
        or not nearTarget(src, v.coords)
        or not jobAllowed(src, v.jobs)
    then return end

    Tokens[v.shutter] = (Tokens[v.shutter] or 0) + 1
    setState(v.shutter, false)

    if not exports.samy_shutters:IsShutterOpen(v.shutter) then
        toggle(v.shutter, v.speed)
    end
end)
