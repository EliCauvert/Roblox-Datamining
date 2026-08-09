local expChat = script:FindFirstAncestor("ExpChat")
local textChatService = game:GetService("TextChatService")
local parent = expChat.Parent
local reactModule = require(parent.React)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local list = require(parent.llama).List
local dictionary = require(parent.llama).Dictionary
local configModule = require(expChat.Config)
local fFlagExpChatEnableFocusNavigationModule = require(expChat.Flags.FFlagExpChatEnableFocusNavigation)
local autocompleteEntryModule = require(script.Parent.AutocompleteEntry)

return reactModule.memo(function(p0) --[[ line: 20 | named "AutoCompleteDropdown" ]]
	-- upvalues: reactModule (ref), useStyle (ref), dictionary (ref), autocompleteEntryModule (ref), list (ref), configModule (ref), textChatService (ref), fFlagExpChatEnableFocusNavigationModule (ref)
	local var6 = reactModule.useRef(nil)
	local theme = useStyle().Theme
	local var7 = reactModule.useCallback(function(p1) --[[ line: 26 ]]
		-- upvalues: dictionary (copy), reactModule (copy), autocompleteEntryModule (copy), p0 (ref), list (copy)
		local var19 = dictionary.map(p1, function(p2, p3) --[[ line: 27 ]]
			-- upvalues: reactModule (copy), autocompleteEntryModule (copy), p0 (copy), list (copy), p1 (ref)
			return reactModule.createElement(autocompleteEntryModule, {
				result = p2,
				layoutOrder = p3,
				chatInputBarSettings = p0.chatInputBarSettings,
				setTransparency = p0.setTransparency,
				transparencyValue = p0.transparencyValue,
				isDividerVisible = list.count(p1) ~= p3,
				selectedIndex = p0.selectedIndex,
				autocompleteType = p0.autocompleteType,
				onAutocompleteDropdownHover = p0.onAutocompleteDropdownHover,
				onAutocompleteSelected = p0.onAutocompleteSelected
			}), p2
		end)
		var19["$layout"] = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
		
		return var19
	end)
	
	local function setCanvasPosition() --[[ line: 51 ]]
		-- upvalues: var6 (ref), p0 (ref), configModule (copy)
		if not var6.current then
			return Vector2.new(0, 0)
		end
		local current = p0.autocompleteDropdownRef.current
		local var20 = if current then current.AbsoluteSize.Y else configModule.AutocompleteFrameDefaultSizeY
		local var21 = p0.chatInputBarSettings.TextSize + 16
		local var22 = 0
		
		if current and current:FindFirstChild("ScrollBarFrame") and (current.ScrollBarFrame:FindFirstChild("ScrollViewFrame") and current.ScrollBarFrame.ScrollViewFrame:FindFirstChild("ScrollView")) and current.ScrollBarFrame.ScrollViewFrame.ScrollView:FindFirstChild("OffsetFrame") then
			for i, v in ipairs(current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
				if v.ClassName == "Frame" and v.LayoutOrder <= p0.selectedIndex then
					var22 += v.AbsoluteSize.Y
					
					if v.LayoutOrder == p0.selectedIndex then
						var21 = v.AbsoluteSize.Y
					end
				end
			end
		end
		local y = var6.current.CanvasPosition.Y
		local var23 = var22 - var21
		
		return Vector2.new(0, if var23 < y then var23 elseif y + var20 < var22 then var22 - var20 else y)
	end
	
	local verticalAlignment = nil
	local enabled = false
	local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	
	if chatWindowConfiguration then
		verticalAlignment = chatWindowConfiguration.VerticalAlignment
		enabled = chatWindowConfiguration.Enabled
	end
	local y
	local var10 = verticalAlignment == Enum.VerticalAlignment.Top and not enabled
	local var11 = p0.textBoxRef.current and p0.textBoxRef.current.AbsoluteSize.Y + 20
	local chatWindow = p0.autocompleteDropdownRef.current and (p0.autocompleteDropdownRef.current:FindFirstAncestor("appLayout") and (p0.autocompleteDropdownRef.current:FindFirstAncestor("appLayout"):FindFirstChild("chatWindow") or nil))
	local createElement = reactModule.createElement
	local var13 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		ZIndex = 2,
		AnchorPoint = var10 and Vector2.new(0, 0) or Vector2.new(0, 1),
		Size = UDim2.new(0.95, 0, 0, if #p0.results > 3 then configModule.AutocompleteFrameDefaultSizeY else #p0.results * configModule.AutocompleteEntryDefaultSizeY),
		Position = UDim2.new(0, 0, 0, if var10 then var11 else 0),
		Visible = p0.activated and #p0.results > 0,
		ref = p0.autocompleteDropdownRef
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var16 = "UISizeConstraint"
	local t_2 = {}
	local new = Vector2.new
	local chatWindowMaxWidth = configModule.ChatWindowMaxWidth
	
	if chatWindow and not var10 then
		y = chatWindow.AbsoluteSize.Y or 1e999
	end
	t_2.MaxSize = new(chatWindowMaxWidth, y)
	t_1.UISizeConstraint = createElement_1(var16, t_2)
	t_1.ScrollBarFrame = reactModule.createElement("Frame", {
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = p0.setTransparency(0, p0.transparencyValue),
		BackgroundColor3 = p0.chatInputBarSettings.BackgroundColor3
	}, {
		Border = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChatInputBarBorderColor3,
			Transparency = p0.setTransparency(configModule.ChatInputBarBorderTransparency, p0.transparencyValue)
		}),
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) }),
		ScrollViewFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1)
		}, {
			ScrollView = reactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 4,
				ClipsDescendants = false,
				ZIndex = 2,
				Size = UDim2.new(1, -4, 1, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(0, 0, 0, #p0.results * configModule.AutocompleteEntryDefaultSizeY),
				CanvasPosition = setCanvasPosition(),
				ScrollBarImageColor3 = theme.UIEmphasis.Color,
				ScrollBarImageTransparency = p0.setTransparency(0, p0.transparencyValue),
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				Selectable = if fFlagExpChatEnableFocusNavigationModule then false else true,
				ref = var6
			}, {
				OffsetFrame = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 8, 1, 0) }, var7(p0.results))
			})
		})
	})
	
	return createElement(var13, t, t_1)
end)