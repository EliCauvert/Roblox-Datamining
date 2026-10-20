local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetGameMediaStoreFunction = require(Parent.DataHydration).Game.getGameMediaStore

return function(p1)
	-- upvalues: ReactModule (copy), GetGameMediaStoreFunction (copy), SignalsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(GetGameMediaStoreFunction().getAndFetchGameMedia((tostring(p1))).data)
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), GetGameMediaStoreFunction (upval), p1 (copy), UseStateResult2 (copy)
		local Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: GetGameMediaStoreFunction (upval), p1 (upval), UseStateResult2 (upval)
			UseStateResult2(GetGameMediaStoreFunction(p2).getAndFetchGameMedia((tostring(p1))).data(p2))
		end)
		
		return function()
			-- upvalues: Effect (copy)
			Effect()
		end
	end, { p1 })
	
	return {
		icon = ReactModule.useMemo(function(): string
			-- upvalues: p1 (copy)
			return string.format("rbxthumb://type=GameIcon&id=%d&w=512&h=512", p1)
		end, { p1 }),
		thumbnails = ReactModule.useMemo(function()
			-- upvalues: UseStateResult (copy)
			if not UseStateResult then
				return {}
			end
			local List = {}
			
			for _, value in UseStateResult do
				local MediaType = "image"
				local Text = tostring(value.videoId or value.imageId)
				local Text1 = nil
				
				if not value.videoId then
					if value.imageId then
						Text1 = "rbxassetid://" .. tostring(value.imageId)
					else
						continue
					end
				else
					MediaType = "video"
					Text1 = "rbxassetid://" .. tostring(value.videoId)
				end
				table.insert(List, {
					id = Text,
					mediaType = MediaType,
					assetSource = Text1,
					assetResourceName = if value.imageId then `assets/{value.imageId}` else nil
				})
			end
			return List
		end, { UseStateResult })
	}
end