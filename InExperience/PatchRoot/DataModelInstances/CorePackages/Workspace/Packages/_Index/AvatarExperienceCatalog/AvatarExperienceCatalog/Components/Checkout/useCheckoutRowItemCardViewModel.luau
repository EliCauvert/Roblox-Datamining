local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(avatarExperienceCatalog.Stores.createAXShoppingCartStore)
local useTimedOptionsFtuxModule = require(avatarExperienceCatalog.Hooks.useTimedOptionsFtux)
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local fFlagAXDurables2Option = require(parent.AvatarExperienceFlags).FFlagAXDurables2Option
local _2optionOfferPillTooltipTimeout = game:DefineFastInt("2OptionOfferPillTooltipTimeout", 5)

return function(p0) --[[ line: 19 | named "useCheckoutRowItemCardViewModel" ]]
	-- upvalues: reactModule (ref), fFlagAXMISWithBlackbird (ref), fFlagAXDurables2Option (ref), useTimedOptionsFtuxModule (ref), _2optionOfferPillTooltipTimeout (ref)
	local var5, var6 = reactModule.useState(function() --[[ line: 20 ]]
		-- upvalues: p0 (ref)
		if p0.timedOptions then
			for i, v in p0.timedOptions do
				if v.selected then
					return v.price
				end
			end
		end
		return nil
	end)
	reactModule.useEffect(function() --[[ line: 32 ]]
		-- upvalues: p0 (ref), var6 (ref), fFlagAXMISWithBlackbird (copy)
		if p0.selectedTimedOptionIndexInReducer ~= nil then
			local selectedTimedOptionIndexInReducer = p0.timedOptions and p0.timedOptions[p0.selectedTimedOptionIndexInReducer]
			
			if selectedTimedOptionIndexInReducer then
				var6(selectedTimedOptionIndexInReducer.price)
				
				return
			end
		elseif fFlagAXMISWithBlackbird and p0.timedOptions then
			for i, v in p0.timedOptions do
				if v.selected then
					var6(v.price)
					
					return
				end
			end
		end
	end, {
		p0.selectedTimedOptionIndexInReducer,
		if fFlagAXMISWithBlackbird then p0.timedOptions else nil
	})
	local var7 = nil
	local _ = nil
	
	if fFlagAXDurables2Option then
		local var8 = useTimedOptionsFtuxModule()
		local var9, var10 = reactModule.useState(var8.shouldShow2OptionOfferPillTooltip())
		var7 = var9
		local var11 = var10
		reactModule.useEffect(function() --[[ line: 60 ]]
			-- upvalues: var7 (write), _2optionOfferPillTooltipTimeout (copy), var11 (write), var8 (ref)
			local var13 = if var7 then task.delay(_2optionOfferPillTooltipTimeout, function() --[[ line: 62 ]]
				-- upvalues: var11 (copy), var8 (copy)
				var11(false)
				var8.hide2OptionOfferPillTooltip()
			end) else nil
			
			return function() --[[ line: 68 ]]
				-- upvalues: var13 (ref)
				if var13 then
					task.cancel(var13)
				end
			end
		end, { var7, var11, var8 })
	end
	return {
		selectedTimedOptionPrice = var5,
		setSelectedTimedOptionPrice = var6,
		showOfferPillTooltip = if fFlagAXDurables2Option then var7 else nil
	}
end