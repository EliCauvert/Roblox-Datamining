local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local dropdownMenu = require(parent.UIBlox).App.Menu.DropdownMenu

return function(p1)
	-- upvalues: reactModule (ref), cryoModule (ref), useLocalization (ref), dropdownMenu (ref)
	local var1 = useLocalization(reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref)
		return cryoModule.Dictionary.union(cryoModule.Dictionary.map(p1.options, function(p2)
			return p2.localizationKey, p2.value
		end), { ChooseOne = "Feature.ReportAbuse.Label.ChooseOne" })
	end, { p1.options }))
	local var2 = useLocalization(reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref)
		return cryoModule.Dictionary.map(p1.options, function(p2)
			return p2.descriptionLocalizationKey, p2.value
		end)
	end, { p1.options }))
	
	return reactModule.createElement(dropdownMenu, {
		showDropShadow = true,
		dropdownMenuListPositionFixed = true,
		placeholder = var1.ChooseOne,
		onChange = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), var2 (ref)
			p1.setDropdownError(false)
			p1.onSelectedAbuseType(p2)
			
			if p1.setDescription then
				p1.setDescription(var2[p2] or "")
			end
		end, { p1.setDropdownError, p1.onSelectedAbuseType }),
		screenSize = p1.screenSize,
		height = UDim.new(0, p1.menuItemHeight),
		fixedListHeight = math.min(p1.menuItemHeight * #p1.options, p1.maxHeight),
		errorState = p1.isDropdownError,
		cellDatas = reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), p1 (ref), var1 (ref)
			return cryoModule.List.map(p1.options, function(p2)
				-- upvalues: var1 (copy)
				return { text = var1[p2.value] or "", key = p2.value }
			end)
		end, { p1.options, var1 }),
		defaultKey = p1.reportCategoryDefaultKey,
		isDisabled = p1.isDisabled
	})
end