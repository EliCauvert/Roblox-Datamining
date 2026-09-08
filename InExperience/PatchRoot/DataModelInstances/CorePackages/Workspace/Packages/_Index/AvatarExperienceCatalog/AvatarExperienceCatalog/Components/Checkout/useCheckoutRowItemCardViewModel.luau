local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(avatarExperienceCatalog.Stores.createAXShoppingCartStore)
local useTimedOptionsFtuxModule = require(avatarExperienceCatalog.Hooks.useTimedOptionsFtux)
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local fFlagAXDurables2Option = require(parent.AvatarExperienceFlags).FFlagAXDurables2Option
local _2optionOfferPillTooltipTimeout = game:DefineFastInt("2OptionOfferPillTooltipTimeout", 5)

return function(p1)
	-- upvalues: reactModule (ref), fFlagAXMISWithBlackbird (ref), fFlagAXDurables2Option (ref), useTimedOptionsFtuxModule (ref), _2optionOfferPillTooltipTimeout (ref)
	local var1, var2 = reactModule.useState(function()
		-- upvalues: p1 (ref)
		if p1.timedOptions then
			for i, v in p1.timedOptions do
				if v.selected then
					return v.price
				end
			end
		end
		return nil
	end)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), fFlagAXMISWithBlackbird (copy)
		if p1.selectedTimedOptionIndexInReducer ~= nil then
			local selectedTimedOptionIndexInReducer = p1.timedOptions and p1.timedOptions[p1.selectedTimedOptionIndexInReducer]
			
			if selectedTimedOptionIndexInReducer then
				var2(selectedTimedOptionIndexInReducer.price)
				
				return
			end
		elseif fFlagAXMISWithBlackbird and p1.timedOptions then
			for i, v in p1.timedOptions do
				if v.selected then
					var2(v.price)
					
					return
				end
			end
		end
	end, {
		p1.selectedTimedOptionIndexInReducer,
		if fFlagAXMISWithBlackbird then p1.timedOptions else nil
	})
	local var3 = nil
	local _ = nil
	
	if fFlagAXDurables2Option then
		local var4 = useTimedOptionsFtuxModule()
		local var5, var6 = reactModule.useState(var4.shouldShow2OptionOfferPillTooltip())
		var3 = var5
		local var7 = var6
		reactModule.useEffect(function()
			-- upvalues: var3 (write), _2optionOfferPillTooltipTimeout (copy), var7 (write), var4 (ref)
			local var8 = if var3 then task.delay(_2optionOfferPillTooltipTimeout, function()
				-- upvalues: var7 (copy), var4 (copy)
				var7(false)
				var4.hide2OptionOfferPillTooltip()
			end) else nil
			
			return function()
				-- upvalues: var8 (ref)
				if var8 then
					task.cancel(var8)
				end
			end
		end, { var3, var7, var4 })
	end
	return {
		selectedTimedOptionPrice = var1,
		setSelectedTimedOptionPrice = var2,
		showOfferPillTooltip = if fFlagAXDurables2Option then var3 else nil
	}
end