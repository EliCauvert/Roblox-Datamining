local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getGameMediaStore = require(parent.DataHydration).Game.getGameMediaStore

return function(p1)
	-- upvalues: reactModule (ref), getGameMediaStore (ref), signalsModule (ref)
	local var1, var2 = reactModule.useState(getGameMediaStore().getAndFetchGameMedia(tostring(p1)).data)
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), getGameMediaStore (copy), p1 (ref), var2 (ref)
		local var3 = signalsModule.createEffect(function(p2)
			-- upvalues: getGameMediaStore (copy), p1 (copy), var2 (copy)
			var2(getGameMediaStore(p2).getAndFetchGameMedia(tostring(p1)).data(p2))
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3()
		end
	end, { p1 })
	
	return {
		icon = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return string.format("rbxthumb://type=GameIcon&id=%d&w=512&h=512", p1)
		end, { p1 }),
		thumbnails = reactModule.useMemo(function()
			-- upvalues: var1 (ref)
			if not var1 then
				return {}
			end
			local t = {}
			
			for i, v in var1 do
				local text
				local var3 = "image"
				local _ = nil
				local var4 = tostring(v.videoId or v.imageId)
				
				if v.videoId then
					var3 = "video"
					text = "rbxassetid://" .. tostring(v.videoId)
					table.insert(t, {
						id = var4,
						mediaType = var3,
						assetSource = text,
						assetResourceName = if v.imageId then `assets/{v.imageId}` else nil
					})
				elseif v.imageId then
					text = "rbxassetid://" .. tostring(v.imageId)
				end
			end
			return t
		end, { var1 })
	}
end