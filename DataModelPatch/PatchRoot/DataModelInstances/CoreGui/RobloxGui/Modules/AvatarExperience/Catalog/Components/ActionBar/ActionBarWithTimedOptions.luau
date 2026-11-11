local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ActionButtonModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.ActionButton)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local WearTimeSelectedOption = require(CorePackages.Workspace.Packages.AvatarExperienceTimedOptions).WearTimeSelectedOption
local SetSelectedTimedOptionFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).State.Actions.SetSelectedTimedOption
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar.useBuyActionBarButtonProps)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local FFlagAXDurablesForMIS = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesForMIS
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local NoFFlagAXDurablesForMIS: boolean = game:DefineFastFlag("AXTimedOptionsBarHeightFix", false) and not FFlagAXDurablesForMIS

function ActionBarWithTimedOptions(p1)
	-- upvalues: UseTokensFunction (copy), FFlagAXDurablesForMIS (copy), UseDispatchFunction (copy), ReactModule (copy), SetSelectedTimedOptionFunction (copy), FFlagEnableLeftNavOnConsole (copy), UseSignalStateFunction (copy), DisplayModule (copy), WithStyleFunction (copy), View (copy), NoFFlagAXDurablesForMIS (copy), WearTimeSelectedOption (copy), ActionButtonModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = if FFlagAXDurablesForMIS then UseDispatchFunction() else nil
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), FFlagAXDurablesForMIS (upval)
		if p1.timedOptions then
			if FFlagAXDurablesForMIS then
				if p1.selectedTimedOptionIndexInReducer == nil then
					for _, timedOption in p1.timedOptions do
						if timedOption.selected then
							if p1.onSelectedDaysChanged then
								p1.onSelectedDaysChanged(timedOption.days)
								break
							end
						else
							continue
						end
					end
					return
				else
					local TimedOption = p1.timedOptions[p1.selectedTimedOptionIndexInReducer]
					
					if TimedOption and p1.onSelectedDaysChanged then
						p1.onSelectedDaysChanged(TimedOption.days)
						
						return
					end
				end
			else
				for _, timedOption1 in p1.timedOptions do
					if timedOption1.selected then
						if not p1.onSelectedDaysChanged then break end
						p1.onSelectedDaysChanged(timedOption1.days)
						break
					else
						continue
					end
				end
			end
		end
	end, {
		p1.timedOptions,
		p1.onSelectedDaysChanged,
		if FFlagAXDurablesForMIS then p1.selectedTimedOptionIndexInReducer else nil
	})
	local UseResult = ReactModule.useCallback(function(SelectedTimedOptionIndex)
		-- upvalues: p1 (copy), FFlagAXDurablesForMIS (upval), UseDispatchResult (copy), SetSelectedTimedOptionFunction (upval)
		if p1.onSelectedDaysChanged then
			local Days = if p1.timedOptions[SelectedTimedOptionIndex] then p1.timedOptions[SelectedTimedOptionIndex].days else nil
			
			if Days == 0 then
				p1.onSelectedDaysChanged(nil)
			else
				p1.onSelectedDaysChanged(Days)
			end
			if FFlagAXDurablesForMIS and UseDispatchResult and p1.itemId and p1.itemType then
				UseDispatchResult(SetSelectedTimedOptionFunction({
					itemId = p1.itemId,
					itemType = p1.itemType,
					selectedTimedOptionIndex = SelectedTimedOptionIndex
				}))
			end
		end
	end, {
		p1.onSelectedDaysChanged,
		p1.timedOptions,
		if FFlagAXDurablesForMIS then p1.itemId else nil,
		if FFlagAXDurablesForMIS then p1.itemType else nil,
		if FFlagAXDurablesForMIS then UseDispatchResult else nil
	})
	local UseSignalStateResult = if FFlagEnableLeftNavOnConsole then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return WithStyleFunction(function(p2)
		-- upvalues: ReactModule (upval), View (upval), NoFFlagAXDurablesForMIS (upval), UseTokensResult (copy), FFlagAXDurablesForMIS (upval), FFlagEnableLeftNavOnConsole (upval), UseSignalStateResult (copy), WearTimeSelectedOption (upval), p1 (copy), UseResult (copy), ActionButtonModule (upval)
		return ReactModule.createElement(View, {
			tag = "size-full-0",
			Size = if NoFFlagAXDurablesForMIS then UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1800) else UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1500)
		}, {
			ActionBarFrame = ReactModule.createElement(View, {
				tag = if FFlagAXDurablesForMIS then "padding-x-xlarge padding-top-large bg-surface-0" else "padding-left-large padding-right-large padding-top-small bg-surface-0",
				Size = if FFlagAXDurablesForMIS or NoFFlagAXDurablesForMIS then UDim2.new(1, if FFlagEnableLeftNavOnConsole then UseSignalStateResult.right else 0, 0, UseTokensResult.Size.Size_1800 + (FFlagEnableLeftNavOnConsole and UseSignalStateResult.bottom or 0)) else UDim2.new(1, if FFlagEnableLeftNavOnConsole then UseSignalStateResult.right else 0, 0, UseTokensResult.Size.Size_1500 + (FFlagEnableLeftNavOnConsole and UseSignalStateResult.bottom or 0)),
				Position = if FFlagAXDurablesForMIS or NoFFlagAXDurablesForMIS then UDim2.new(0, 0, 1, -UseTokensResult.Size.Size_1800) else UDim2.new(0, 0, 1, -UseTokensResult.Size.Size_1500),
				padding = if FFlagEnableLeftNavOnConsole then {
					right = UDim.new(0, UseSignalStateResult.right),
					bottom = UDim.new(0, UseSignalStateResult.bottom)
				} else nil
			}, {
				TimedOptions = ReactModule.createElement(View, {
					tag = "bg-surface-0",
					LayoutOrder = 1,
					Size = UDim2.new(0, UseTokensResult.Size.Size_2000, 0, UseTokensResult.Size.Size_1000),
					Position = if FFlagAXDurablesForMIS then UDim2.new(0, 0, 0, -UseTokensResult.Size.Size_200) elseif NoFFlagAXDurablesForMIS then UDim2.fromOffset(0, UseTokensResult.Size.Size_200) else nil
				}, {
					OptionMenu = ReactModule.createElement(WearTimeSelectedOption, {
						options = p1.timedOptions,
						selectedTimedOptionIndexInReducer = if FFlagAXDurablesForMIS then p1.selectedTimedOptionIndexInReducer else nil,
						onOptionActivated = UseResult
					})
				}),
				ActionButton = ReactModule.createElement(ActionButtonModule, {
					LayoutOrder = 3,
					Size = if FFlagAXDurablesForMIS then UDim2.new(0.5, -UseTokensResult.Size.Size_250, 0, UseTokensResult.Size.Size_1000) else UDim2.new(0.5, -UseTokensResult.Size.Size_250, 1, -UseTokensResult.Size.Size_250),
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, 0, 0, 0),
					Font = p2.Font,
					buttonProps = p1.buttonProps
				})
			})
		})
	end)
end

return ActionBarWithTimedOptions