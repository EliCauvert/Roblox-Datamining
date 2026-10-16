local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local DropdownMenu = require(Parent.UIBlox).App.Menu.DropdownMenu

return function(p1) --[[ Line: 30 | Named "ReasonDropdown" ]]
	-- upvalues: ReactModule (copy), CryoModule (copy), UseLocalizationFunction (copy), DropdownMenu (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 41 ]]
		-- upvalues: CryoModule (upval), p1 (copy)
		return (CryoModule.Dictionary.map(p1.options, function(p2) --[[ Line: 42 ]]
			return p2.descriptionLocalizationKey, p2.value
		end))
	end, { p1.options })
	local UseLocalizationResult = UseLocalizationFunction((ReactModule.useMemo(function() --[[ Line: 31 ]]
		-- upvalues: CryoModule (upval), p1 (copy)
		return CryoModule.Dictionary.union(CryoModule.Dictionary.map(p1.options, function(p2) --[[ Line: 32 ]]
			return p2.localizationKey, p2.value
		end), { ChooseOne = "Feature.ReportAbuse.Label.ChooseOne" })
	end, { p1.options })))
	local UseLocalizationResult1 = UseLocalizationFunction(UseMemoResult)
	
	return ReactModule.createElement(DropdownMenu, {
		showDropShadow = true,
		dropdownMenuListPositionFixed = true,
		placeholder = UseLocalizationResult.ChooseOne,
		onChange = ReactModule.useCallback(function(p2) --[[ Line: 60 ]]
			-- upvalues: p1 (copy), UseLocalizationResult1 (copy)
			p1.setDropdownError(false)
			p1.onSelectedAbuseType(p2)
			
			if p1.setDescription then
				p1.setDescription(UseLocalizationResult1[p2] or "")
			end
		end, { p1.setDropdownError, p1.onSelectedAbuseType }),
		screenSize = p1.screenSize,
		height = UDim.new(0, p1.menuItemHeight),
		fixedListHeight = math.min(p1.menuItemHeight * #p1.options, p1.maxHeight),
		errorState = p1.isDropdownError,
		cellDatas = ReactModule.useMemo(function() --[[ Line: 51 ]]
			-- upvalues: CryoModule (upval), p1 (copy), UseLocalizationResult (copy)
			return CryoModule.List.map(p1.options, function(p2) --[[ Line: 52 ]]
				-- upvalues: UseLocalizationResult (upval)
				return {
					text = UseLocalizationResult[p2.value] or "",
					key = p2.value
				}
			end)
		end, { p1.options, UseLocalizationResult }),
		defaultKey = p1.reportCategoryDefaultKey,
		isDisabled = p1.isDisabled
	})
end