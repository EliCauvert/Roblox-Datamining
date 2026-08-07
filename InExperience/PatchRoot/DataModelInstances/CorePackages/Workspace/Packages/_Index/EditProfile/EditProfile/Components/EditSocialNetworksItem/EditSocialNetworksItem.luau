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

return function(p0) --[[ line: 34 | named "EditSocialNetworksItem" ]]
	-- upvalues: reactModule (ref), useStyle (ref), useScreenSize (ref), socialNetworksInEditProfileIXPModule (ref), userInputService (ref), imageSetLabel (ref), images (ref), callbackInputBox (ref), iconSize (ref)
	local var5 = reactModule.useRef(nil)
	local var6 = useStyle()
	local font = var6.Font
	local theme = var6.Theme
	local var7 = font.BaseSize * font.Body.RelativeSize
	local var8 = useScreenSize()
	local var9 = socialNetworksInEditProfileIXPModule.useGetExperimentVariant({ isExposureEnabled = true })
	local var10 = if var9 then var9 == socialNetworksInEditProfileIXPModule.Variants.VisibilityFirst and p0.isVisibilityNoOne else nil
	local var11 = reactModule.useCallback(function() --[[ line: 48 ]]
		-- upvalues: userInputService (copy), var5 (ref), p0 (ref)
		if userInputService.OnScreenKeyboardVisible then
			if not var5.current or not var5.current:IsFocused() then return end
			local var12 = userInputService.OnScreenKeyboardPosition.Y - (var5.current.AbsolutePosition.Y + var5.current.AbsoluteSize.Y)
			
			if var12 < 0 then
				p0.setKeyboardOffset(var12)
				
				return
			end
			p0.setKeyboardOffset(0)
			
			return
		else
			p0.setKeyboardOffset(0)
		end
	end, { var8, p0.setKeyboardOffset })
	reactModule.useEffect(function() --[[ line: 64 ]]
		-- upvalues: userInputService (copy), var11 (ref), p0 (ref), var5 (ref)
		local list = {
			userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var11),
			userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var11)
		}
		
		if p0.focusOn then
			task.spawn(function() --[[ line: 71 ]]
				-- upvalues: var5 (copy)
				if var5 and var5.current then
					var5.current:captureFocus()
				end
			end)
		end
		return function() --[[ line: 78 ]]
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { var11 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.layoutOrder,
		Interactable = not var10
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = if var9 == socialNetworksInEditProfileIXPModule.Variants.VisibilityFirst then UDim.new(0, 12) else nil,
			PaddingBottom = if var9 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then UDim.new(0, 12) else nil
		}),
		NetworkLabel = reactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			RichText = true,
			Font = font.Body.Font,
			Text = p0.networkTitle,
			TextSize = var7,
			TextColor3 = theme.TextDefault.Color,
			AutomaticSize = Enum.AutomaticSize.XY
		}),
		InputBackground = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, var7 + 20),
			Image = images["component_assets/circle_21"],
			ImageColor3 = theme.UIMuted.Color,
			ImageTransparency = theme.UIMuted.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9)
		}, {
			InputBorder = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var7 + 20),
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
					captureFocusOnMount = p0.focusOn,
					clearButtonSize = iconSize.Small,
					clearIcon = images["icons/actions/edit/clear_small"],
					clearIconColor3 = theme.IconEmphasis.Color,
					clearIconTransparency = if var10 then theme.PlaceHolder.Transparency else nil,
					initialInputText = p0.initialText,
					inputBoxRef = var5,
					inputTextColor3 = theme.TextDefault.Color,
					inputTextSize = var7,
					inputTextTransparency = if var10 then theme.PlaceHolder.Transparency else theme.TextDefault.Transparency,
					inputTextXAlignment = Enum.TextXAlignment.Left,
					placeholderText = p0.placeholderText,
					placeholderTextColor3 = theme.TextDefault.Color,
					placeholderTextTransparency = if var10 then theme.PlaceHolder.Transparency else nil,
					textChangedCallback = p0.textChanged
				})
			})
		})
	})
end