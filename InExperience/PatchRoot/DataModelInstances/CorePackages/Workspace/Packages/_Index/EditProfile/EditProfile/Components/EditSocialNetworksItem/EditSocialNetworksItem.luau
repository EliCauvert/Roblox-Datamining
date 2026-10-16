local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.Constant.IconSize
local SocialNetworksInEditProfileIXPModule = require(EditProfile.Flags.SocialNetworksInEditProfileIXP)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local CallbackInputBox = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.CallbackInputBox

return function(p1) --[[ Line: 37 | Named "EditSocialNetworksItem" ]]
	-- upvalues: ReactModule (copy), UseStyleFunction (copy), UseScreenSizeFunction (copy), SocialNetworksInEditProfileIXPModule (copy), UserInputService (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), ImageSetLabel (copy), Images (copy), CallbackInputBox (copy), IconSize (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
	local UseGetExperimentVariantResult = SocialNetworksInEditProfileIXPModule.useGetExperimentVariant({ isExposureEnabled = true })
	local IsVisibilityNoOne = if UseGetExperimentVariantResult then UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityFirst and p1.isVisibilityNoOne else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 51 ]]
		-- upvalues: UserInputService (upval), UseRefResult (copy), p1 (copy)
		if not UserInputService.OnScreenKeyboardVisible then
			p1.setKeyboardOffset(0)
		elseif UseRefResult.current and UseRefResult.current:IsFocused() then
			local YDelta = UserInputService.OnScreenKeyboardPosition.Y - (UseRefResult.current.AbsolutePosition.Y + UseRefResult.current.AbsoluteSize.Y)
			
			if YDelta < 0 then
				p1.setKeyboardOffset(YDelta)
				
				return
			else
				p1.setKeyboardOffset(0)
				
				return
			end
		end
	end, { UseScreenSizeFunction(), p1.setKeyboardOffset })
	ReactModule.useEffect(function() --[[ Line: 67 ]]
		-- upvalues: UserInputService (upval), UseResult (copy), p1 (copy), UseRefResult (copy)
		local Connections = {
			UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(UseResult),
			UserInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(UseResult)
		}
		
		if p1.focusOn then
			task.spawn(function() --[[ Line: 74 ]]
				-- upvalues: UseRefResult (upval)
				if UseRefResult and UseRefResult.current then
					UseRefResult.current:captureFocus()
				end
			end)
		end
		return function() --[[ Line: 81 ]]
			-- upvalues: Connections (copy)
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, { UseResult })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		Interactable = not IsVisibilityNoOne
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityFirst then UDim.new(0, 12) else nil,
			PaddingBottom = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then UDim.new(0, 12) else nil
		}),
		NetworkLabel = ReactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			RichText = true,
			Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.Body.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
			Text = p1.networkTitle,
			TextSize = ScaledBaseSize,
			TextColor3 = Theme.TextDefault.Color,
			AutomaticSize = Enum.AutomaticSize.XY
		}),
		InputBackground = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, ScaledBaseSize + 20),
			Image = Images["component_assets/circle_21"],
			ImageColor3 = Theme.UIMuted.Color,
			ImageTransparency = Theme.UIMuted.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9)
		}, {
			InputBorder = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, ScaledBaseSize + 20),
				Image = Images["component_assets/circle_21_stroke_1"],
				ImageColor3 = Theme.Divider.Color,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9)
			}, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				TextBox = ReactModule.createElement(CallbackInputBox, {
					clearButtonDisabled = false,
					captureFocusOnMount = p1.focusOn,
					clearButtonSize = IconSize.Small,
					clearIcon = Images["icons/actions/edit/clear_small"],
					clearIconColor3 = Theme.IconEmphasis.Color,
					clearIconTransparency = if IsVisibilityNoOne then Theme.PlaceHolder.Transparency else nil,
					initialInputText = p1.initialText,
					inputBoxRef = UseRefResult,
					inputTextColor3 = Theme.TextDefault.Color,
					inputTextSize = ScaledBaseSize,
					inputTextTransparency = if IsVisibilityNoOne then Theme.PlaceHolder.Transparency else Theme.TextDefault.Transparency,
					inputTextXAlignment = Enum.TextXAlignment.Left,
					placeholderText = p1.placeholderText,
					placeholderTextColor3 = Theme.TextDefault.Color,
					placeholderTextTransparency = if IsVisibilityNoOne then Theme.PlaceHolder.Transparency else nil,
					textChangedCallback = p1.textChanged
				})
			})
		})
	})
end