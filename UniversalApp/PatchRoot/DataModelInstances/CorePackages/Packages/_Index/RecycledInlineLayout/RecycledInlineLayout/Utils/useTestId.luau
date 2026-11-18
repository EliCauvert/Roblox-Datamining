local CollectionService = game:GetService("CollectionService")
local ReactModule = require(script:FindFirstAncestor("RecycledInlineLayout").Parent.React)

return function(Id, p1, Count)
	-- upvalues: ReactModule (copy), CollectionService (copy)
	ReactModule.useLayoutEffect(function()
		-- upvalues: Count (copy), ReactModule (upval), Id (copy), p1 (copy), CollectionService (upval)
		local MapResult = if Count == nil then Id:map(function(Id)
			return { id = Id }
		end) else ReactModule.joinBindings({ id = Id, count = Count })
		local Ids = {}
		
		local function apply(p2)
			-- upvalues: p1 (upval), Ids (copy), CollectionService (upval)
			for i, value in p1 do
				local Current = value.current
				local Id = if p2.count == nil or i <= p2.count then p2.id else nil
				
				if Current ~= nil and Ids[Current] ~= Id then
					if Ids[Current] ~= nil then
						CollectionService:RemoveTag(Current, "data-testid=" .. Ids[Current])
					end
					Ids[Current] = Id
					
					if Id ~= nil then
						CollectionService:AddTag(Current, "data-testid=" .. Id)
					end
				end
			end
		end
		
		apply(MapResult:getValue())
		local SubscribeToBindingResult = ReactModule.__subscribeToBinding(MapResult, apply)
		
		return function()
			-- upvalues: SubscribeToBindingResult (copy), Ids (copy), CollectionService (upval)
			SubscribeToBindingResult()
			
			for i, id in Ids do
				CollectionService:RemoveTag(i, "data-testid=" .. id)
			end
		end
	end)
end