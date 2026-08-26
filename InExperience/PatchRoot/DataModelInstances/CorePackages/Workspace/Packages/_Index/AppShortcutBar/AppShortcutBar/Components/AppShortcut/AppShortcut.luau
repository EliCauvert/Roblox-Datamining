local textService = game:GetService("TextService")
local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local useStyle = UIBloxModule.Core.Style.useStyle
local useTokens = foundationModule.Hooks.useTokens
local icon = foundationModule.Icon
local keyLabel = UIBloxModule.App.Menu.KeyLabel
local keyLabelUtilities = UIBloxModule.App.Menu.KeyLabelUtilities
local stateLayer = UIBloxModule.Core.Control.StateLayer
local shortcut = UIBloxModule.App.Navigation.Shortcut
local iconWithHoldAnimationModule = require(script.Parent.IconWithHoldAnimation)
local shortcutUseDispatchSyntheticEvent = game:DefineFastFlag("ShortcutUseDispatchSyntheticEvent", false)

local function _(p1, p2)
	-- upvalues: keyLabelUtilities (ref)
	local var1 = 0
	
	for i, v in p1 do
		var1 += keyLabelUtilities.getKeyLabelWidth(v, p2)
	end
	return var1
end

local function useOnShortcutActivated(p3)
	-- upvalues: shortcutUseDispatchSyntheticEvent (ref), reactModule (ref), reactFocusNavigationModule (ref)
	if shortcutUseDispatchSyntheticEvent then
		local var2 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
		local var3 = reactFocusNavigationModule.useDispatchSyntheticEvent()
		
		return reactModule.useCallback(function()
			-- upvalues: p3 (ref), var3 (ref), var2 (ref)
			if p3.hasProgress then
				var3(p3.eventName, var2.focusedGuiObject:getValue(), {
					immediateDispatch = true,
					UserInputState = Enum.UserInputState.Begin,
					KeyCode = p3.inputKeyCode,
					UserInputType = Enum.UserInputType.None
				})
				
				return
			end
			var3(p3.eventName, var2.focusedGuiObject:getValue(), {
				immediateDispatch = true,
				UserInputState = Enum.UserInputState.End,
				KeyCode = p3.inputKeyCode,
				UserInputType = Enum.UserInputType.None
			})
		end, {
			p3.hasProgress,
			p3.eventName,
			p3.inputKeyCode,
			var2,
			var3
		})
	end
	local var4 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	
	return reactModule.useMemo(function()
		-- upvalues: var4 (ref), p3 (ref)
		return function()
			-- upvalues: var4 (copy), p3 (copy)
			local selection = var4._engineInterface.getSelection()
			
			if not selection then return end
			local inputKeyCode = var4.activeEventMap:getValue()[p3.inputKeyCode]
			
			if inputKeyCode == p3.eventName then
				var4._eventPropagationService:propagateEvent(selection, inputKeyCode, {
					KeyCode = p3.inputKeyCode,
					UserInputState = Enum.UserInputState.Begin
				}, false)
				task.wait(0.1)
				var4._eventPropagationService:propagateEvent(selection, inputKeyCode, {
					KeyCode = p3.inputKeyCode,
					UserInputState = Enum.UserInputState.End
				}, false)
				
				return
			end
		end
	end, { var4, p3.inputKeyCode, p3.eventName })
end

function AppShortcut(p3)
	-- upvalues: useStyle (ref), useTokens (ref), keyLabelUtilities (ref), reactModule (ref), textService (ref), keyLabel (ref), iconWithHoldAnimationModule (ref), icon (ref), useOnShortcutActivated (ref), shortcut (ref), stateLayer (ref)
	local var2, size900
	local layoutOrder = p3.layoutOrder
	local item = p3.item
	local var3 = useStyle()
	local var4 = useTokens()
	local isTable = typeof(item.icon) == "table"
	local _ = nil
	local _ = nil
	
	if item.hasProgress then
		var2 = var4.Size.Size_1300 / 2
		size900 = var4.Size.Size_1300 / 2
	elseif isTable then
		local icon_1 = item.icon
		local font = var3.Font
		local var5 = 0
		
		for i, v in icon_1 do
			var5 += keyLabelUtilities.getKeyLabelWidth(v, font)
		end
		var2 = var5
		size900 = var4.Size.Size_900
	else
		var2 = var4.Size.Size_600
		size900 = var4.Size.Size_600
	end
	local var6 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), textService (copy), item (ref), var2 (write)
		local labelMedium = var4.Typography.LabelMedium
		
		return UDim2.new(0, var2 + var4.Gap.XSmall + textService:GetTextSize(item.text, math.floor(labelMedium.FontSize), labelMedium.Font, Vector2.new(1e999, 1e999)).X, 1, 0)
	end, { var4, var2, item.text })
	local var7 = reactModule.useMemo(function()
		-- upvalues: isTable (ref), reactModule (copy), item (ref), keyLabel (copy)
		if not isTable then
			return nil
		end
		local t = {
			ListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		
		for i, v in item.icon do
			t["KeyLabel_" .. tostring(i)] = reactModule.createElement(keyLabel, {
				iconThemeKey = "IconEmphasis",
				LayoutOrder = i,
				keyCode = v
			})
		end
		return t
	end, { isTable, item.icon, var4 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		Size = var6
	}, {
		ShortcutFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1)
		}, {
			Shortcut = reactModule.createElement(shortcut, {
				size = UDim2.fromScale(1, 1),
				automaticSize = Enum.AutomaticSize.None,
				iconLabelGap = var4.Gap.XSmall,
				publicProps = item,
				labelTextSize = var4.Typography.LabelMedium.FontSize,
				labelColorStyle = var4.Color.Label,
				labelFontStyle = var4.Typography.LabelMedium,
				renderIcon = reactModule.useCallback(function(p4)
					-- upvalues: item (ref), reactModule (copy), iconWithHoldAnimationModule (copy), var2 (write), size900 (write), var4 (ref), isTable (ref), var7 (ref), icon (copy)
					return if item.hasProgress then reactModule.createElement(iconWithHoldAnimationModule, {
						layoutOrder = p4.layoutOrder,
						size = UDim2.fromOffset(var2, size900),
						progress = item.progress,
						icon = item.icon,
						iconSize = var4.Size.Size_900 / 2
					}) else reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = p4.layoutOrder,
						Size = UDim2.fromOffset(var2, size900)
					}, if isTable then var7 else {
						Icon = reactModule.createElement(icon, {
							name = item.icon,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5)
						})
					})
				end, {
					item.hasProgress, item.progress, item.icon, var2, size900, isTable, var7
				})
			})
		}),
		StateLayer = reactModule.createElement(stateLayer, {
			selectable = false,
			zIndex = 1,
			cornerRadius = UDim.new(0, var4.Radius.Medium),
			size = reactModule.useMemo(function()
				-- upvalues: var6 (ref), var4 (ref)
				return var6 + UDim2.fromOffset(var4.Size.Size_100 * 2, 0)
			end, { var6, var4 }),
			onActivated = useOnShortcutActivated(item)
		})
	})
end

return reactModule.memo(AppShortcut)