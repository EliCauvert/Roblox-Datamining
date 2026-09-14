local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getGameMediaStore = require(parent.DataHydration).Game.getGameMediaStore

return function(p1)
	-- upvalues: getGameMediaStore (ref), signalsReactModule (ref), reactModule (ref)
	local andFetchGameMedia = getGameMediaStore(false).getAndFetchGameMedia(tostring(p1))
	local var1 = signalsReactModule.useSignalState(andFetchGameMedia.data)
	
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
				local var2 = "image"
				local _ = nil
				local var3 = tostring(v.videoId or v.imageId)
				
				if v.videoId then
					var2 = "video"
					text = "rbxassetid://" .. tostring(v.videoId)
					table.insert(t, {
						id = var3,
						mediaType = var2,
						assetSource = text,
						assetResourceName = if v.imageId then `assets/{v.imageId}` else nil
					})
				elseif v.imageId then
					text = "rbxassetid://" .. tostring(v.imageId)
				end
			end
			return t
		end, { var1 }),
		status = signalsReactModule.useSignalState(andFetchGameMedia.status)
	}
end