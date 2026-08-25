local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local dropdownMenu = require(parent.UIBlox).App.Menu.DropdownMenu

return function(p0)
	-- upvalues: reactModule (ref), cryoModule (ref), useLocalization (ref), dropdownMenu (ref)
	local var2 = useLocalization(reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p0 (ref)
		return cryoModule.Dictionary.union(cryoModule.Dictionary.map(p0.options, function(p1)
			return p1.localizationKey, p1.value
		end), { ChooseOne = "Feature.ReportAbuse.Label.ChooseOne" })
	end, { p0.options }))
	local var3 = useLocalization(reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p0 (ref)
		return cryoModule.Dictionary.map(p0.options, function(p2)
			return p2.descriptionLocalizationKey, p2.value
		end)
	end, { p0.options }))
	
	return reactModule.createElement(dropdownMenu, {
		showDropShadow = true,
		dropdownMenuListPositionFixed = true,
		placeholder = var2.ChooseOne,
		onChange = reactModule.useCallback(function(p3)
			-- upvalues: p0 (ref), var3 (ref)
			p0.setDropdownError(false)
			p0.onSelectedAbuseType(p3)
			
			if p0.setDescription then
				p0.setDescription(var3[p3] or "")
			end
		end, { p0.setDropdownError, p0.onSelectedAbuseType }),
		screenSize = p0.screenSize,
		height = UDim.new(0, p0.menuItemHeight),
		fixedListHeight = math.min(p0.menuItemHeight * #p0.options, p0.maxHeight),
		errorState = p0.isDropdownError,
		cellDatas = reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), p0 (ref), var2 (ref)
			return cryoModule.List.map(p0.options, function(p4)
				-- upvalues: var2 (copy)
				return { text = var2[p4.value] or "", key = p4.value }
			end)
		end, { p0.options, var2 }),
		defaultKey = p0.reportCategoryDefaultKey,
		isDisabled = p0.isDisabled
	})
end