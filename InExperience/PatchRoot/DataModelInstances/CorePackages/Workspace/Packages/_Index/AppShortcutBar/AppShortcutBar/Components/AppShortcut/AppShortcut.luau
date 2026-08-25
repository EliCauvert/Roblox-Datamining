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

local function _(p0, p1)
	-- upvalues: keyLabelUtilities (ref)
	local var8 = 0
	
	for i, v in p0 do
		var8 += keyLabelUtilities.getKeyLabelWidth(v, p1)
	end
	return var8
end

local function useOnShortcutActivated(p2)
	-- upvalues: shortcutUseDispatchSyntheticEvent (ref), reactModule (ref), reactFocusNavigationModule (ref)
	if shortcutUseDispatchSyntheticEvent then
		local var9 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
		local var10 = reactFocusNavigationModule.useDispatchSyntheticEvent()
		
		return reactModule.useCallback(function()
			-- upvalues: p2 (ref), var10 (ref), var9 (ref)
			if p2.hasProgress then
				var10(p2.eventName, var9.focusedGuiObject:getValue(), {
					immediateDispatch = true,
					UserInputState = Enum.UserInputState.Begin,
					KeyCode = p2.inputKeyCode,
					UserInputType = Enum.UserInputType.None
				})
				
				return
			end
			var10(p2.eventName, var9.focusedGuiObject:getValue(), {
				immediateDispatch = true,
				UserInputState = Enum.UserInputState.End,
				KeyCode = p2.inputKeyCode,
				UserInputType = Enum.UserInputType.None
			})
		end, {
			p2.hasProgress,
			p2.eventName,
			p2.inputKeyCode,
			var9,
			var10
		})
	end
	local var11 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	
	return reactModule.useMemo(function()
		-- upvalues: var11 (ref), p2 (ref)
		return function()
			-- upvalues: var11 (copy), p2 (copy)
			local selection = var11._engineInterface.getSelection()
			
			if not selection then return end
			local inputKeyCode = var11.activeEventMap:getValue()[p2.inputKeyCode]
			
			if inputKeyCode == p2.eventName then
				var11._eventPropagationService:propagateEvent(selection, inputKeyCode, {
					KeyCode = p2.inputKeyCode,
					UserInputState = Enum.UserInputState.Begin
				}, false)
				task.wait(0.1)
				var11._eventPropagationService:propagateEvent(selection, inputKeyCode, {
					KeyCode = p2.inputKeyCode,
					UserInputState = Enum.UserInputState.End
				}, false)
				
				return
			end
		end
	end, { var11, p2.inputKeyCode, p2.eventName })
end

function AppShortcut(p3)
	-- upvalues: useStyle (ref), useTokens (ref), keyLabelUtilities (ref), reactModule (ref), textService (ref), keyLabel (ref), iconWithHoldAnimationModule (ref), icon (ref), useOnShortcutActivated (ref), shortcut (ref), stateLayer (ref)
	local var17, size900
	local layoutOrder = p3.layoutOrder
	local item = p3.item
	local var13 = useStyle()
	local var14 = useTokens()
	local isTable = typeof(item.icon) == "table"
	local _ = nil
	local _ = nil
	
	if item.hasProgress then
		var17 = var14.Size.Size_1300 / 2
		size900 = var14.Size.Size_1300 / 2
	elseif isTable then
		local icon_1 = item.icon
		local font = var13.Font
		local var16 = 0
		
		for i, v in icon_1 do
			var16 += keyLabelUtilities.getKeyLabelWidth(v, font)
		end
		var17 = var16
		size900 = var14.Size.Size_900
	else
		var17 = var14.Size.Size_600
		size900 = var14.Size.Size_600
	end
	local var18 = reactModule.useMemo(function()
		-- upvalues: var14 (ref), textService (copy), item (ref), var17 (write)
		local labelMedium = var14.Typography.LabelMedium
		
		return UDim2.new(0, var17 + var14.Gap.XSmall + textService:GetTextSize(item.text, math.floor(labelMedium.FontSize), labelMedium.Font, Vector2.new(1e999, 1e999)).X, 1, 0)
	end, { var14, var17, item.text })
	local var19 = reactModule.useMemo(function()
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
	end, { isTable, item.icon, var14 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		Size = var18
	}, {
		ShortcutFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1)
		}, {
			Shortcut = reactModule.createElement(shortcut, {
				size = UDim2.fromScale(1, 1),
				automaticSize = Enum.AutomaticSize.None,
				iconLabelGap = var14.Gap.XSmall,
				publicProps = item,
				labelTextSize = var14.Typography.LabelMedium.FontSize,
				labelColorStyle = var14.Color.Label,
				labelFontStyle = var14.Typography.LabelMedium,
				renderIcon = reactModule.useCallback(function(p4)
					-- upvalues: item (ref), reactModule (copy), iconWithHoldAnimationModule (copy), var17 (write), size900 (write), var14 (ref), isTable (ref), var19 (ref), icon (copy)
					return if item.hasProgress then reactModule.createElement(iconWithHoldAnimationModule, {
						layoutOrder = p4.layoutOrder,
						size = UDim2.fromOffset(var17, size900),
						progress = item.progress,
						icon = item.icon,
						iconSize = var14.Size.Size_900 / 2
					}) else reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = p4.layoutOrder,
						Size = UDim2.fromOffset(var17, size900)
					}, if isTable then var19 else {
						Icon = reactModule.createElement(icon, {
							name = item.icon,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5)
						})
					})
				end, {
					item.hasProgress, item.progress, item.icon, var17, size900, isTable, var19
				})
			})
		}),
		StateLayer = reactModule.createElement(stateLayer, {
			selectable = false,
			zIndex = 1,
			cornerRadius = UDim.new(0, var14.Radius.Medium),
			size = reactModule.useMemo(function()
				-- upvalues: var18 (ref), var14 (ref)
				return var18 + UDim2.fromOffset(var14.Size.Size_100 * 2, 0)
			end, { var18, var14 }),
			onActivated = useOnShortcutActivated(item)
		})
	})
end

return reactModule.memo(AppShortcut)