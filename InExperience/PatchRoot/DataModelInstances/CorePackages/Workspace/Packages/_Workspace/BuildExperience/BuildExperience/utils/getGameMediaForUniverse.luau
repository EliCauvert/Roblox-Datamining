local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getGameMediaStore = require(parent.DataHydration).Game.getGameMediaStore

return function(p0) --[[ line: 22 | named "useGameMediaForUniverse" ]]
	-- upvalues: reactModule (ref), getGameMediaStore (ref), signalsModule (ref)
	local var2, var3 = reactModule.useState(getGameMediaStore().getAndFetchGameMedia(tostring(p0)).data)
	reactModule.useEffect(function() --[[ line: 26 ]]
		-- upvalues: signalsModule (copy), getGameMediaStore (copy), p0 (ref), var3 (ref)
		local var4 = signalsModule.createEffect(function(p1) --[[ line: 27 ]]
			-- upvalues: getGameMediaStore (copy), p0 (copy), var3 (copy)
			var3(getGameMediaStore(p1).getAndFetchGameMedia(tostring(p0)).data(p1))
		end)
		
		return function() --[[ line: 31 ]]
			-- upvalues: var4 (ref)
			var4()
		end
	end, { p0 })
	
	return {
		icon = reactModule.useMemo(function() --[[ line: 36 ]]
			-- upvalues: p0 (ref)
			return string.format("rbxthumb://type=GameIcon&id=%d&w=512&h=512", p0)
		end, { p0 }),
		thumbnails = reactModule.useMemo(function() --[[ line: 40 ]]
			-- upvalues: var2 (ref)
			if not var2 then
				return {}
			end
			local t = {}
			
			for i, v in var2 do
				local var6 = "image"
				local text = nil
				
				if v.videoId then
					var6 = "video"
					text = "rbxassetid://" .. tostring(v.videoId)
				elseif v.imageId then
					text = "rbxassetid://" .. tostring(v.imageId)
				end
				table.insert(t, {
					id = `thumbnail_{i}`,
					mediaType = var6,
					assetSource = text,
					assetResourceName = if v.imageId then `assets/{v.imageId}` else nil
				})
			end
			return t
		end, { var2 })
	}
end