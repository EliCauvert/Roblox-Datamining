local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local _ = require(script.Parent.AssetLibraryTypes)
local dataStatus = dataHydrationModule.DataStatus
local getGameMediaForUniverseModule = require(buildExperience.utils.getGameMediaForUniverse)

return function(p1)
	-- upvalues: getGameMediaForUniverseModule (ref), reactModule (ref), dataHydrationModule (ref), dataStatus (ref)
	local var1 = getGameMediaForUniverseModule(p1.universeId)
	local var2 = p1.query(false)
	local onOpenAsset = p1.onOpenAsset
	
	return {
		assets = reactModule.useMemo(function()
			-- upvalues: var2 (ref), onOpenAsset (ref), p1 (ref), var1 (ref)
			local t = {}
			local lowerText = string.lower(var2)
			
			local function addAsset(value, p2, p3)
				-- upvalues: lowerText (ref), t (ref), onOpenAsset (copy)
				if (if lowerText ~= "" then string.find(string.lower(p2), lowerText, 1, true) ~= nil else true) and p3 ~= nil then
					table.insert(t, {
						assetType = "Image",
						subtitle = nil,
						assetId = value,
						displayName = p2,
						thumbnail = p3,
						onActivated = if onOpenAsset == nil then nil else function()
							-- upvalues: onOpenAsset (copy), value (ref)
							onOpenAsset(value)
						end
					})
				end
			end
			
			addAsset(p1.universeId, p1.iconDisplayName, var1.icon)
			
			for i, v in var1.thumbnails do
				local var3 = tonumber(v.id)
				
				if v.mediaType == "image" and var3 ~= nil then
					addAsset(var3, `{p1.thumbnailDisplayName} {i}`, v.assetSource)
				end
			end
			return t
		end, {
			var1.icon, var1.thumbnails, p1.iconDisplayName, onOpenAsset or false,
			p1.thumbnailDisplayName, p1.universeId, var2
		}),
		status = if var1.status == dataStatus.NotReady then "Loading" elseif var1.status == dataStatus.Failed then "Failed" else "Ready",
		onRetry = reactModule.useCallback(function()
			-- upvalues: dataHydrationModule (copy), p1 (ref)
			dataHydrationModule.Game.getGameMediaStore(false).fetchGameMedia(tostring(p1.universeId))
		end, { p1.universeId })
	}
end