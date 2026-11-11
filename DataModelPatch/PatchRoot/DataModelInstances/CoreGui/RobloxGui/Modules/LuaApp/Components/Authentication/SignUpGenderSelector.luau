local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local GetImageDataFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local UserGender = AuthCommonModule.Enums.UserGender
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local GetFIntLuaLoginGenderSelectorModule = require(Modules.LuaApp.Flags.GetFIntLuaLoginGenderSelector)
local RegisterAuditContent = AuthCommonModule.Components.RegisterAuditContent
local GetFFlagEnableAuditForSinglePageSignUpFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAuditForSinglePageSignUp
local FixGenderSelectorIconLightTheme = game:DefineFastFlag("FixGenderSelectorIconLightTheme", false)
local _UDim2 = UDim2.new(0.8888888888888888, 0, 0.8888888888888888, 0)
local SignUpGenderSelector = RoactModule.PureComponent:extend("SignUpGenderSelector")
SignUpGenderSelector.defaultProps = { size = UDim2.new(1, 0, 0, 48) }

function SignUpGenderSelector.init(p1)
	-- upvalues: UserGender (copy), EventStreamConstantsModule (copy)
	p1.state = {
		hoverRight = false,
		hoverLeft = false,
		gender = UserGender.Unknown
	}
	p1.isMounted = false
	
	function p1.onGenderSelected(Gender)
		-- upvalues: UserGender (upval), p1 (copy), EventStreamConstantsModule (upval)
		spawn(function()
			-- upvalues: Gender (ref), UserGender (upval), p1 (upval), EventStreamConstantsModule (upval)
			if Gender == UserGender.Male then
				p1.props.analytics.reportButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.GenderMale)
			else
				p1.props.analytics.reportButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.GenderFemale)
			end
			if p1.isMounted then
				if p1.state.gender == Gender then
					Gender = UserGender.Unknown
				end
				p1:setState({ gender = Gender })
				
				if p1.props.onGenderChanged then
					p1.props.onGenderChanged(Gender)
				end
			end
		end)
	end
	
	function p1.isSelectedGenderMale(): boolean
		-- upvalues: p1 (copy), UserGender (upval)
		return p1.state.gender == UserGender.Male
	end
	
	function p1.isSelectedGenderFemale(): boolean
		-- upvalues: p1 (copy), UserGender (upval)
		return p1.state.gender == UserGender.Female
	end
	
	function p1.onMouseEnterRight()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ hoverRight = true })
		end
	end
	
	function p1.onMouseLeaveRight()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ hoverRight = false })
		end
	end
	
	function p1.onMouseEnterLeft()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ hoverLeft = true })
		end
	end
	
	function p1.onMouseLeaveLeft()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ hoverLeft = false })
		end
	end
end

function SignUpGenderSelector.didMount(p1)
	p1.isMounted = true
end

function SignUpGenderSelector.willUnmount(p1)
	p1.isMounted = false
end

function SignUpGenderSelector.render(p1)
	-- upvalues: GetFIntLuaLoginGenderSelectorModule (copy), WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy), FitChildrenModule (copy), FitTextLabelModule (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (copy), RegisterAuditContent (copy), ImageSetLabel (copy), GetImageDataFunction (copy), DEPRECATEDImageSetButtonModule (copy), UserGender (copy), _UDim2 (copy), Images (copy), FixGenderSelectorIconLightTheme (copy)
	local LayoutOrder = p1.props.layoutOrder
	local Size = p1.props.size
	local AuthenticationSignUpLabelOptionalGender: string = if GetFIntLuaLoginGenderSelectorModule() == 1 then "Authentication.SignUp.Label.OptionalGender" else "Authentication.SignUp.Label.Gender"
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), GetFIntLuaLoginGenderSelectorModule (upval), RoactModule (upval), FitChildrenModule (upval), LayoutOrder (copy), FitTextLabelModule (upval), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), p1 (copy), RegisterAuditContent (upval), AuthenticationSignUpLabelOptionalGender (copy), Size (copy), ImageSetLabel (upval), GetImageDataFunction (upval), DEPRECATEDImageSetButtonModule (upval), UserGender (upval), _UDim2 (upval), Images (upval), FixGenderSelectorIconLightTheme (upval)
		return WithLocalizationModule({
			titleText = if GetFIntLuaLoginGenderSelectorModule() == 1 then "Authentication.SignUp.Label.OptionalGender" else "Authentication.SignUp.Label.Gender"
		})(function(p3)
			-- upvalues: RoactModule (upval), FitChildrenModule (upval), LayoutOrder (upval), FitTextLabelModule (upval), p2 (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), p1 (upval), RegisterAuditContent (upval), AuthenticationSignUpLabelOptionalGender (upval), Size (upval), ImageSetLabel (upval), GetImageDataFunction (upval), DEPRECATEDImageSetButtonModule (upval), UserGender (upval), _UDim2 (upval), Images (upval), FixGenderSelectorIconLightTheme (upval)
			return RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				LayoutOrder = LayoutOrder,
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = FitChildrenModule.FitAxis.Height
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 5)
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 5),
					PaddingBottom = UDim.new(0, 5)
				}),
				Title = p3.titleText and RoactModule.createElement(FitTextLabelModule, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height,
					Text = p3.titleText or "",
					Font = p2.Font.CaptionHeader.Font,
					TextSize = p2.Font.BaseSize * p2.Font.CaptionHeader.RelativeSize,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					TextTransparency = p2.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				RegisterTitleAuditContent = if GetFFlagEnableAuditForSinglePageSignUpFunction() and p1.props.enableAuditContentCapture and p3.titleText then RoactModule.createElement(RegisterAuditContent, {
					translationKey = AuthenticationSignUpLabelOptionalGender,
					translatedSourceString = p3.titleText
				}) else nil,
				Frame = RoactModule.createElement("Frame", { LayoutOrder = 3, BackgroundTransparency = 1, Size = Size }, {
					Boundary = RoactModule.createElement(ImageSetLabel, {
						ZIndex = 3,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, 0),
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(9, 9, 9, 9),
						Image = GetImageDataFunction("LuaApp/buttons/buttonStroke") or "LuaApp/buttons/buttonStroke",
						ImageColor3 = p2.Theme.SecondaryDefault.Color
					}),
					BackgroundImage = RoactModule.createElement(ImageSetLabel, {
						ZIndex = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, 0),
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(9, 9, 9, 9),
						Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
						ImageColor3 = p2.Theme.SecondaryDefault.Color
					}, {
						UIListLayout2 = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 1)
						}),
						Left = RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
							LayoutOrder = 1,
							Size = UDim2.new(0.5, 0, 1, 0),
							AutoButtonColor = false,
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(7, 8, 7, 8),
							ClipsDescendants = true,
							Image = "LuaApp/buttons/buttonLeftFill",
							ImageColor3 = p2.Theme.BackgroundContrast.Color,
							ImageTransparency = 0,
							[RoactModule.Event.Activated] = function()
								-- upvalues: p1 (upval), UserGender (upval)
								p1.onGenderSelected(UserGender.Female)
							end,
							[RoactModule.Event.MouseEnter] = p1.onMouseEnterLeft,
							[RoactModule.Event.MouseLeave] = p1.onMouseLeaveLeft
						}, {
							LeftIcon = RoactModule.createElement(ImageSetLabel, {
								LayoutOrder = 1,
								BorderSizePixel = 0,
								ClipsDescendants = true,
								BackgroundTransparency = 1,
								Size = _UDim2,
								ScaleType = Enum.ScaleType.Fit,
								Position = UDim2.new(0.5, 0, 0.5, 0),
								AnchorPoint = Vector2.new(0.5, 0.5),
								Image = if p1.isSelectedGenderFemale() then Images["icons/common/gender_female_selected"] else Images["icons/common/gender_female"],
								ImageColor3 = if FixGenderSelectorIconLightTheme then p2.Theme.IconEmphasis.Color else nil,
								ImageTransparency = if FixGenderSelectorIconLightTheme then p2.Theme.IconEmphasis.Transparency else p2.Theme.BackgroundUIDefault.Transparency
							})
						}),
						Right = RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
							LayoutOrder = 2,
							Size = UDim2.new(0.5, -1, 1, 0),
							AutoButtonColor = false,
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(1, 8, 1, 8),
							ClipsDescendants = true,
							Image = "LuaApp/buttons/buttonRightFill",
							ImageColor3 = p2.Theme.BackgroundContrast.Color,
							ImageTransparency = 0,
							[RoactModule.Event.Activated] = function()
								-- upvalues: p1 (upval), UserGender (upval)
								p1.onGenderSelected(UserGender.Male)
							end,
							[RoactModule.Event.MouseEnter] = p1.onMouseEnterRight,
							[RoactModule.Event.MouseLeave] = p1.onMouseLeaveRight
						}, {
							RightIcon = RoactModule.createElement(ImageSetLabel, {
								LayoutOrder = 1,
								BorderSizePixel = 0,
								ClipsDescendants = true,
								BackgroundTransparency = 1,
								Size = _UDim2,
								ScaleType = Enum.ScaleType.Fit,
								Position = UDim2.new(0.5, 0, 0.5, 0),
								AnchorPoint = Vector2.new(0.5, 0.5),
								Image = if p1.isSelectedGenderMale() then Images["icons/common/gender_male_selected"] else Images["icons/common/gender_male"],
								ImageColor3 = if FixGenderSelectorIconLightTheme then p2.Theme.IconEmphasis.Color else nil,
								ImageTransparency = if FixGenderSelectorIconLightTheme then p2.Theme.IconEmphasis.Transparency else p2.Theme.BackgroundUIDefault.Transparency
							})
						})
					})
				})
			})
		end)
	end)
end

return (RoactServices.connect({ analytics = RoactAnalyticsAuthEventsModule })(SignUpGenderSelector))