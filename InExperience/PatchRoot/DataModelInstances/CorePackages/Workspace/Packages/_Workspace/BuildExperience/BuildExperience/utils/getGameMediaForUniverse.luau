local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getGameMediaStore = require(parent.DataHydration).Game.getGameMediaStore

return function(p0)
	-- upvalues: reactModule (ref), getGameMediaStore (ref), signalsModule (ref)
	local var2, var3 = reactModule.useState(getGameMediaStore().getAndFetchGameMedia(tostring(p0)).data)
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), getGameMediaStore (copy), p0 (ref), var3 (ref)
		local var4 = signalsModule.createEffect(function(p1)
			-- upvalues: getGameMediaStore (copy), p0 (copy), var3 (copy)
			var3(getGameMediaStore(p1).getAndFetchGameMedia(tostring(p0)).data(p1))
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4()
		end
	end, { p0 })
	
	return {
		icon = reactModule.useMemo(function()
			-- upvalues: p0 (ref)
			return string.format("rbxthumb://type=GameIcon&id=%d&w=512&h=512", p0)
		end, { p0 }),
		thumbnails = reactModule.useMemo(function()
			-- upvalues: var2 (ref)
			if not var2 then
				return {}
			end
			local t = {}
			
			for i, v in var2 do
				local text
				local var6 = "image"
				local _ = nil
				local var7 = tostring(v.videoId or v.imageId)
				
				if v.videoId then
					var6 = "video"
					text = "rbxassetid://" .. tostring(v.videoId)
					table.insert(t, {
						id = var7,
						mediaType = var6,
						assetSource = text,
						assetResourceName = if v.imageId then `assets/{v.imageId}` else nil
					})
				elseif v.imageId then
					text = "rbxassetid://" .. tostring(v.imageId)
				end
			end
			return t
		end, { var2 })
	}
end