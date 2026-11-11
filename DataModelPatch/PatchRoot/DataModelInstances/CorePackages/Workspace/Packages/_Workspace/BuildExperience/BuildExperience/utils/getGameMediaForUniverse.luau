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
			
			for i, value in UseStateResult do
				local MediaType = "image"
				local AssetSource: string? = nil
				
				if value.videoId then
					MediaType = "video"
					AssetSource = "rbxassetid://" .. tostring(value.videoId)
				elseif value.imageId then
					AssetSource = "rbxassetid://" .. tostring(value.imageId)
				end
				table.insert(List, {
					id = `thumbnail_{i}`,
					mediaType = MediaType,
					assetSource = AssetSource
				})
			end
			return List
		end, { UseStateResult })
	}
end