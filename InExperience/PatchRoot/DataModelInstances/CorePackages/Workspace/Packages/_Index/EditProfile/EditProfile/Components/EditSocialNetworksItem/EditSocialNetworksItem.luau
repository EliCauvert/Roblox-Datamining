local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local iconSize = UIBloxModule.App.Constant.IconSize
local socialNetworksInEditProfileIXPModule = require(editProfile.Flags.SocialNetworksInEditProfileIXP)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local callbackInputBox = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.CallbackInputBox

return function(p1)
	-- upvalues: reactModule (ref), useStyle (ref), useScreenSize (ref), socialNetworksInEditProfileIXPModule (ref), userInputService (ref), imageSetLabel (ref), images (ref), callbackInputBox (ref), iconSize (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = useStyle()
	local font = var2.Font
	local theme = var2.Theme
	local var3 = font.BaseSize * font.Body.RelativeSize
	local var4 = useScreenSize()
	local var5 = socialNetworksInEditProfileIXPModule.useGetExperimentVariant({ isExposureEnabled = true })
	local var6 = if var5 then var5 == socialNetworksInEditProfileIXPModule.Variants.VisibilityFirst and p1.isVisibilityNoOne else nil
	local var7 = reactModule.useCallback(function()
		-- upvalues: userInputService (copy), var1 (ref), p1 (ref)
		if userInputService.OnScreenKeyboardVisible then
			if not var1.current or not var1.current:IsFocused() then return end
			local var8 = userInputService.OnScreenKeyboardPosition.Y - (var1.current.AbsolutePosition.Y + var1.current.AbsoluteSize.Y)
			
			if var8 < 0 then
				p1.setKeyboardOffset(var8)
				
				return
			end
			p1.setKeyboardOffset(0)
			
			return
		else
			p1.setKeyboardOffset(0)
		end
	end, { var4, p1.setKeyboardOffset })
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var7 (ref), p1 (ref), var1 (ref)
		local list = {
			userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var7),
			userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var7)
		}
		
		if p1.focusOn then
			task.spawn(function()
				-- upvalues: var1 (copy)
				if var1 and var1.current then
					var1.current:captureFocus()
				end
			end)
		end
		return function()
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { var7 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		Interactable = not var6
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = if var5 == socialNetworksInEditProfileIXPModule.Variants.VisibilityFirst then UDim.new(0, 12) else nil,
			PaddingBottom = if var5 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then UDim.new(0, 12) else nil
		}),
		NetworkLabel = reactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			RichText = true,
			Font = font.Body.Font,
			Text = p1.networkTitle,
			TextSize = var3,
			TextColor3 = theme.TextDefault.Color,
			AutomaticSize = Enum.AutomaticSize.XY
		}),
		InputBackground = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, var3 + 20),
			Image = images["component_assets/circle_21"],
			ImageColor3 = theme.UIMuted.Color,
			ImageTransparency = theme.UIMuted.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9)
		}, {
			InputBorder = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var3 + 20),
				Image = images["component_assets/circle_21_stroke_1"],
				ImageColor3 = theme.Divider.Color,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9)
			}, {
				Padding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				TextBox = reactModule.createElement(callbackInputBox, {
					clearButtonDisabled = false,
					captureFocusOnMount = p1.focusOn,
					clearButtonSize = iconSize.Small,
					clearIcon = images["icons/actions/edit/clear_small"],
					clearIconColor3 = theme.IconEmphasis.Color,
					clearIconTransparency = if var6 then theme.PlaceHolder.Transparency else nil,
					initialInputText = p1.initialText,
					inputBoxRef = var1,
					inputTextColor3 = theme.TextDefault.Color,
					inputTextSize = var3,
					inputTextTransparency = if var6 then theme.PlaceHolder.Transparency else theme.TextDefault.Transparency,
					inputTextXAlignment = Enum.TextXAlignment.Left,
					placeholderText = p1.placeholderText,
					placeholderTextColor3 = theme.TextDefault.Color,
					placeholderTextTransparency = if var6 then theme.PlaceHolder.Transparency else nil,
					textChangedCallback = p1.textChanged
				})
			})
		})
	})
end