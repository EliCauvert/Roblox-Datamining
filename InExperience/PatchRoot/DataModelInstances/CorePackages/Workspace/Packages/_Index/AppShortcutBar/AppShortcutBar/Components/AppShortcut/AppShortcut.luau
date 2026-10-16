local Parent = script:FindFirstAncestor("AppShortcutBar").Parent
local TextService = game:GetService("TextService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UIBloxModule = require(Parent.UIBlox)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Icon = FoundationModule.Icon
local KeyLabel = UIBloxModule.App.Menu.KeyLabel
local KeyLabelUtilities = UIBloxModule.App.Menu.KeyLabelUtilities
local StateLayer = UIBloxModule.Core.Control.StateLayer
local Shortcut = UIBloxModule.App.Navigation.Shortcut
local IconWithHoldAnimationModule = require(script.Parent.IconWithHoldAnimation)
local ShortcutUseDispatchSyntheticEvent = game:DefineFastFlag("ShortcutUseDispatchSyntheticEvent", false)

local function _(List, p1): number --[[ Line: 27 | Named "getKeyLabelsWidth" ]]
	-- upvalues: KeyLabelUtilities (copy)
	local NewKeyLabelWidth = 0
	
	for _, value in List do
		NewKeyLabelWidth += KeyLabelUtilities.getKeyLabelWidth(value, p1)
	end
	return NewKeyLabelWidth
end

local function useOnShortcutActivated(Item) --[[ Line: 35 ]]
	-- upvalues: ShortcutUseDispatchSyntheticEvent (copy), ReactModule (copy), ReactFocusNavigationModule (copy)
	if ShortcutUseDispatchSyntheticEvent then
		local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
		local UseDispatchSyntheticEventResult = ReactFocusNavigationModule.useDispatchSyntheticEvent()
		
		return (ReactModule.useCallback(function() --[[ Line: 40 ]]
			-- upvalues: Item (copy), UseDispatchSyntheticEventResult (copy), UseContextResult (copy)
			if Item.hasProgress then
				UseDispatchSyntheticEventResult(Item.eventName, UseContextResult.focusedGuiObject:getValue(), {
					immediateDispatch = true,
					UserInputState = Enum.UserInputState.Begin,
					KeyCode = Item.inputKeyCode,
					UserInputType = Enum.UserInputType.None
				})
				
				return
			else
				UseDispatchSyntheticEventResult(Item.eventName, UseContextResult.focusedGuiObject:getValue(), {
					immediateDispatch = true,
					UserInputState = Enum.UserInputState.End,
					KeyCode = Item.inputKeyCode,
					UserInputType = Enum.UserInputType.None
				})
			end
		end, {
			Item.hasProgress,
			Item.eventName,
			Item.inputKeyCode,
			UseContextResult,
			UseDispatchSyntheticEventResult
		}))
	else
		local UseContextResult1 = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
		
		return (ReactModule.useMemo(function() --[[ Line: 61 ]]
			-- upvalues: UseContextResult1 (copy), Item (copy)
			return function() --[[ Line: 62 ]]
				-- upvalues: UseContextResult1 (upval), Item (upval)
				local Selection = UseContextResult1._engineInterface.getSelection()
				
				if not Selection then return end
				local Entry = UseContextResult1.activeEventMap:getValue()[Item.inputKeyCode]
				
				if Entry == Item.eventName then
					UseContextResult1._eventPropagationService:propagateEvent(Selection, Entry, {
						KeyCode = Item.inputKeyCode,
						UserInputState = Enum.UserInputState.Begin
					}, false)
					task.wait(0.1)
					UseContextResult1._eventPropagationService:propagateEvent(Selection, Entry, {
						KeyCode = Item.inputKeyCode,
						UserInputState = Enum.UserInputState.End
					}, false)
					
					return
				end
			end
		end, { UseContextResult1, Item.inputKeyCode, Item.eventName }))
	end
end

function AppShortcut(p2) --[[ Line: 85 ]]
	-- upvalues: UseStyleFunction (copy), UseTokensFunction (copy), KeyLabelUtilities (copy), ReactModule (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), KeyLabel (copy), IconWithHoldAnimationModule (copy), Icon (copy), useOnShortcutActivated (copy), Shortcut (copy), StateLayer (copy)
	local LayoutOrder = p2.layoutOrder
	local Item = p2.item
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local IsTable = typeof(Item.icon) == "table"
	local SizeRatio = nil
	local SizeRatio1 = nil
	
	if Item.hasProgress then
		SizeRatio = UseTokensResult.Size.Size_1300 / 2
		SizeRatio1 = UseTokensResult.Size.Size_1300 / 2
	elseif IsTable then
		local UseStyleResultFont = UseStyleResult.Font
		local NewKeyLabelWidth = 0
		
		for _, value in Item.icon do
			NewKeyLabelWidth += KeyLabelUtilities.getKeyLabelWidth(value, UseStyleResultFont)
		end
		SizeRatio = NewKeyLabelWidth
		SizeRatio1 = UseTokensResult.Size.Size_900
	else
		SizeRatio = UseTokensResult.Size.Size_600
		SizeRatio1 = UseTokensResult.Size.Size_600
	end
	local UseMemoResult = ReactModule.useMemo(function(): UDim2 --[[ Line: 107 ]]
		-- upvalues: UseTokensResult (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), Item (copy), TextService (upval), SizeRatio (ref)
		local LabelMedium = UseTokensResult.Typography.LabelMedium
		local _Vector2 = Vector2.new(1e999, 1e999)
		
		return UDim2.new(0, SizeRatio + UseTokensResult.Gap.XSmall + (if FoundationFontFaceMigration then GetTextSizeFunction(Item.text, math.floor(LabelMedium.FontSize), LabelMedium.Font, _Vector2, { addTemporaryPadding = false }) else TextService:GetTextSize(Item.text, math.floor(LabelMedium.FontSize), LabelMedium.Font, _Vector2)).X, 1, 0)
	end, { UseTokensResult, SizeRatio, Item.text })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 124 ]]
		-- upvalues: IsTable (copy), ReactModule (upval), Item (copy), KeyLabel (upval)
		if not IsTable then
			return nil
		end
		local config = {
			ListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		
		for LayoutOrder, KeyCode in Item.icon do
			config["KeyLabel_" .. tostring(LayoutOrder)] = ReactModule.createElement(KeyLabel, {
				iconThemeKey = "IconEmphasis",
				LayoutOrder = LayoutOrder,
				keyCode = KeyCode
			})
		end
		return config
	end, { IsTable, Item.icon, UseTokensResult })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = LayoutOrder,
		Size = UseMemoResult
	}, {
		ShortcutFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1)
		}, {
			Shortcut = ReactModule.createElement(Shortcut, {
				size = UDim2.fromScale(1, 1),
				automaticSize = Enum.AutomaticSize.None,
				iconLabelGap = UseTokensResult.Gap.XSmall,
				publicProps = Item,
				labelTextSize = UseTokensResult.Typography.LabelMedium.FontSize,
				labelColorStyle = UseTokensResult.Color.Label,
				labelFontStyle = UseTokensResult.Typography.LabelMedium,
				renderIcon = ReactModule.useCallback(function(p3) --[[ Line: 146 ]]
					-- upvalues: Item (copy), ReactModule (upval), IconWithHoldAnimationModule (upval), SizeRatio (ref), SizeRatio1 (ref), UseTokensResult (copy), IsTable (copy), UseMemoResult1 (copy), Icon (upval)
					return if Item.hasProgress then ReactModule.createElement(IconWithHoldAnimationModule, {
						layoutOrder = p3.layoutOrder,
						size = UDim2.fromOffset(SizeRatio, SizeRatio1),
						progress = Item.progress,
						icon = Item.icon,
						iconSize = UseTokensResult.Size.Size_900 / 2
					}) else ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = p3.layoutOrder,
						Size = UDim2.fromOffset(SizeRatio, SizeRatio1)
					}, if IsTable then UseMemoResult1 else {
						Icon = ReactModule.createElement(Icon, {
							name = Item.icon,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5)
						})
					})
				end, {
					Item.hasProgress, Item.progress, Item.icon, SizeRatio, SizeRatio1, IsTable,
					UseMemoResult1,
					if FoundationFontFaceMigration then UseTokensResult.Size.Size_900 else nil
				})
			})
		}),
		StateLayer = ReactModule.createElement(StateLayer, {
			selectable = false,
			zIndex = 1,
			cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
			size = ReactModule.useMemo(function(): UDim2 --[[ Line: 120 ]]
				-- upvalues: UseMemoResult (copy), UseTokensResult (copy)
				return UseMemoResult + UDim2.fromOffset(UseTokensResult.Size.Size_100 * 2, 0)
			end, { UseMemoResult, UseTokensResult }),
			onActivated = useOnShortcutActivated(Item)
		})
	})
end

return ReactModule.memo(AppShortcut)