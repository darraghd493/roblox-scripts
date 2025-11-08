--#region Configuration
local RAW_URL_BASE = "https://raw.githubusercontent.com/darraghd493/roblox-scripts/main/"
--#endregion Configuration

--#region Libraries
local function loadLibrary(url)
	local success, result = pcall(function()
		return loadstring(game:HttpGet(url))()
	end)
	if success then
		return result
	else
		error("Failed to load library from " .. url .. ": " .. tostring(result))
	end
end

local Index = loadLibrary(RAW_URL_BASE .. "loader/index.lua") -- place id -> file name
--#endregion

local scriptPath = Index[game.PlaceId]
if not scriptPath then
	error("No script found for PlaceId " .. tostring(game.PlaceId))
	return
end

local fullUrl = RAW_URL_BASE .. scriptPath
local success, result = pcall(function()
	return loadstring(game:HttpGet(fullUrl))()
end)
if success then
	return result
else
	error("Failed to load script from " .. fullUrl .. ": " .. tostring(result))
end
