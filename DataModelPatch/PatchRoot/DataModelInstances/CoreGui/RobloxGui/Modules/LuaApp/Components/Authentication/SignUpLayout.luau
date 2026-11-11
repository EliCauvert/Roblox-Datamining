local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local SpringAnimatedItem = require(CorePackages.Packages.UIBlox).Utility.SpringAnimatedItem
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local ItemListLayoutModule = require(Modules.LuaApp.Components.Generic.ItemListLayout)
local FullscreenPageWithSafeAreaModule = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local TitleAndParagraphModule = require(Modules.LuaApp.Components.Authentication.TitleAndParagraph)
local DisclaimerLinksModule = require(Modules.LuaApp.Components.Authentication.DisclaimerLinks)
local WrapResult = SpringAnimatedItem.wrap(FitChildrenModule.FitFrame)
local SignUpLayout = RoactModule.PureComponent:extend("SignUpLayout")
SignUpLayout.defaultProps = { widgetScaleWideMode = 0.3, showDisclaimerLinks = false }

function SignUpLayout.init(p1)
	-- upvalues: UserInputService (copy)
	p1.state = {
		containerSize = p1.props.screenSize,
		mainContentsSize = Vector2.new(0, 250),
		keyboardSize = Vector2.new(0, 0)
	}
	p1.isMounted = false
	
	function p1.onAbsoluteSizeChanged(Frame)
		-- upvalues: p1 (copy)
		local AbsoluteSize = Frame.AbsoluteSize
		
		if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
			spawn(function()
				-- upvalues: p1 (upval), AbsoluteSize (copy)
				if p1.isMounted then
					p1:setState({ containerSize = AbsoluteSize })
				end
			end)
		end
	end
	
	function p1.onMainContentsAbsoluteSizeChanged(Frame)
		-- upvalues: p1 (copy)
		local AbsoluteSize = Frame.AbsoluteSize
		local MainContentsSize = p1.state.mainContentsSize
		
		if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 and MainContentsSize ~= AbsoluteSize then
			spawn(function()
				-- upvalues: p1 (upval), AbsoluteSize (copy)
				if p1.isMounted then
					p1:setState({ mainContentsSize = AbsoluteSize })
				end
			end)
		end
	end
	
	function p1.getSpringFrequency(): number
		-- upvalues: UserInputService (upval)
		return 1 / math.max(UserInputService.OnScreenKeyboardAnimationDuration, 0.1)
	end
	
	p1.keyboardEvent = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):connect(function()
		-- upvalues: p1 (copy), UserInputService (upval)
		spawn(function()
			-- upvalues: p1 (upval), UserInputService (upval)
			if p1.isMounted then
				p1:setState({ keyboardSize = UserInputService.OnScreenKeyboardSize })
			end
		end)
	end)
end

function SignUpLayout.didMount(p1)
	p1.isMounted = true
end

function SignUpLayout.willUnmount(p1)
	p1.isMounted = false
	
	if p1.keyboardEvent then
		p1.keyboardEvent:disconnect()
		p1.keyboardEvent = nil
	end
end

function SignUpLayout.renderCharacter(p1)
	-- upvalues: FormFactor (copy), RoactModule (copy), SpringAnimatedItem (copy)
	local RenderCharacterFunction = p1.props.renderCharacter
	local Y = p1.state.keyboardSize.Y
	
	if not RenderCharacterFunction then
		return nil
	end
	local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE
	local SpringFrequency = p1.getSpringFrequency()
	local AvatarPositionYScale = 0.5
	local AvatarAnchorPointY = 0.5
	
	if Y ~= 0 then
		AvatarPositionYScale = 0
		AvatarAnchorPointY = 0
	end
	local config = {
		SizeConstraint = not IsFormFactorMatch and RoactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(250, 250) }),
		AspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize
		}),
		Character = RenderCharacterFunction()
	}
	
	return if IsFormFactorMatch then RoactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
		regularProps = {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.5, 0, 0.6, 0),
			[RoactModule.Children] = config
		},
		animatedValues = {
			avatarPositionYScale = AvatarPositionYScale,
			avatarAnchorPointY = AvatarAnchorPointY
		},
		mapValuesToProps = function(p2)
			return {
				Position = UDim2.new(0.525, 0, p2.avatarPositionYScale, 0),
				AnchorPoint = Vector2.new(0, p2.avatarAnchorPointY)
			}
		end,
		springOptions = { frequency = SpringFrequency }
	}) else RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0.9, 0, 0.9, 0),
		Position = UDim2.new(0.5, 0, 0, p1.state.mainContentsSize.Y),
		AnchorPoint = Vector2.new(0.5, 0)
	}, config)
end

function SignUpLayout.render(p1)
	-- upvalues: FormFactor (copy), UserInputService (copy), RoactModule (copy), FitChildrenModule (copy), TitleAndParagraphModule (copy), DisclaimerLinksModule (copy), WrapResult (copy), ItemListLayoutModule (copy), FullscreenPageWithSafeAreaModule (copy), SpringAnimatedItem (copy)
	local TitleTextKey = p1.props.titleTextKey
	local ParagraphTextKeys = p1.props.paragraphTextKeys
	local RenderWidgetFunction = p1.props.renderWidget
	local FormFactor1 = p1.props.formFactor
	local ShowDisclaimerLinks = p1.props.showDisclaimerLinks
	local WidgetScaleWideMode = p1.props.widgetScaleWideMode
	local DisablePageInteraction = p1.props.disablePageInteraction
	local IsFormFactorMatch = FormFactor1 == FormFactor.WIDE
	local ContainerSize = p1.state.containerSize
	local Y = p1.state.keyboardSize.Y
	local Y1: number = p1.state.mainContentsSize.Y
	local SpringFrequency = p1.getSpringFrequency()
	local _UDim2 = UDim2.new(0.525, 0, 0.5, 0)
	local _Vector2 = Vector2.new(1, 0.5)
	local ScaledX = 400
	
	if ContainerSize.X < 761.9047619047619 then
		_UDim2 = UDim2.new(0, 0, 0.5, 0)
		_Vector2 = Vector2.new(0, 0.5)
		ScaledX = ContainerSize.X * 0.525
	end
	if not IsFormFactorMatch then
		ScaledX = ContainerSize.X - 40
	end
	if IsFormFactorMatch and UserInputService.OnScreenKeyboardVisible then
		_UDim2 = UDim2.new(_UDim2.X.Scale, 0, 0, 0)
		_Vector2 = Vector2.new(_Vector2.X, 0)
	end
	local WidgetHeight = 190
	local Offset = nil
	
	if IsFormFactorMatch then
		WidgetHeight = math.max(ContainerSize.Y * WidgetScaleWideMode, 190)
		Offset = 12
	else
		Offset = 5
	end
	local function v41()
		-- upvalues: RoactModule (upval), FitChildrenModule (upval), p1 (copy), IsFormFactorMatch (copy), Offset (ref), TitleAndParagraphModule (upval), TitleTextKey (copy), ParagraphTextKeys (copy), ScaledX (ref), ShowDisclaimerLinks (copy), DisclaimerLinksModule (upval)
		return RoactModule.createElement(FitChildrenModule.FitFrame, {
			Size = UDim2.new(1, 0, 0, 0),
			fitAxis = FitChildrenModule.FitAxis.Height,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			[RoactModule.Change.AbsoluteSize] = p1.onMainContentsAbsoluteSizeChanged
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Padding = not IsFormFactorMatch and RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 10),
				PaddingLeft = UDim.new(0, 20),
				PaddingRight = UDim.new(0, 20)
			}),
			RoactModule.createElement(FitChildrenModule.FitFrame, {
				LayoutOrder = 1,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = FitChildrenModule.FitAxis.Height
			}, {
				ListLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, Offset)
				}),
				TitleAndParagraph = RoactModule.createElement(TitleAndParagraphModule, {
					layoutOrder = 2,
					titleTextKey = TitleTextKey,
					paragraphTextKeys = ParagraphTextKeys,
					width = ScaledX
				})
			}),
			DisclaimerLinks = ShowDisclaimerLinks and RoactModule.createElement(DisclaimerLinksModule, { LayoutOrder = 3 })
		})
	end
	
	return RoactModule.createElement(FullscreenPageWithSafeAreaModule, {
		BackgroundTransparency = 1,
		includeStatusBar = true,
		renderFullscreenBackground = function()
			-- upvalues: RoactModule (upval)
			return RoactModule.createElement("ImageLabel", {
				Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/gradient_bg.jpg",
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			})
		end
	}, {
		UserInputSink = DisablePageInteraction and RoactModule.createElement("ImageButton", {
			ZIndex = 3,
			BackgroundTransparency = 1,
			Image = "",
			Size = UDim2.new(1, 0, 1, 0)
		}),
		ContentFrame = RoactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
			regularProps = {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				ZIndex = 2,
				[RoactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged,
				[RoactModule.Children] = if IsFormFactorMatch then {
					Container = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.new(0.5, 0, 0, 0),
						Size = UDim2.new(1, 0, 1, -20),
						AnchorPoint = Vector2.new(0.5, 0)
					}, {
						TopPaddingFrame = RoactModule.createElement(WrapResult, {
							regularProps = {
								Size = UDim2.new(0.525, 0, 1, 0),
								BorderSizePixel = 0,
								BackgroundTransparency = 1,
								fitAxis = FitChildrenModule.FitAxis.Height,
								[RoactModule.Children] = {
									SizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(400, 1e999) }),
									Content = RoactModule.createElement(ItemListLayoutModule, {
										size = UDim2.new(1, 0, 0, 0),
										fitAxis = FitChildrenModule.FitAxis.Height,
										Padding = UDim.new(0, 12),
										renderItemList = {
											RoactModule.createElement(v41),
											RoactModule.createElement(FitChildrenModule.FitFrame, {
												BorderSizePixel = 0,
												BackgroundTransparency = 1,
												Size = UDim2.new(1, 0, 0, 0),
												fitAxis = FitChildrenModule.FitAxis.Height
											}, {
												Widget = RenderWidgetFunction and RenderWidgetFunction({ formFactor = FormFactor1, widgetHeight = WidgetHeight })
											})
										}
									})
								}
							},
							animatedValues = {
								contentPositionYScale = _UDim2.Y.Scale,
								contentAnchorPointY = _Vector2.Y
							},
							mapValuesToProps = function(p2)
								-- upvalues: _UDim2 (ref), _Vector2 (ref)
								return {
									Position = UDim2.new(_UDim2.X.Scale, _UDim2.X.Offset, p2.contentPositionYScale, 0),
									AnchorPoint = Vector2.new(_Vector2.X, p2.contentAnchorPointY)
								}
							end,
							springOptions = { frequency = SpringFrequency }
						})
					})
				} else {
					MinHeight = RoactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, 190 + Y1) }),
					MainContents = RoactModule.createElement(v41),
					WidgetWrapper = RoactModule.createElement(FitChildrenModule.FitFrame, {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						ZIndex = 2,
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = FitChildrenModule.FitAxis.Height,
						Position = UDim2.new(0.5, 0, 1, 0),
						AnchorPoint = Vector2.new(0.5, 1)
					}, {
						Widget = RenderWidgetFunction and RenderWidgetFunction({ formFactor = FormFactor1, widgetHeight = WidgetHeight })
					})
				}
			},
			animatedValues = { keyboardSizeY = Y },
			mapValuesToProps = function(p2)
				return { Size = UDim2.new(1, 0, 1, -p2.keyboardSizeY) }
			end,
			springOptions = { frequency = SpringFrequency }
		}),
		Character = p1:renderCharacter()
	})
end

return (RoactRoduxModule.connect(function(p1, _)
	return { formFactor = p1.FormFactor, screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy)
	return {
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackModule())
		end
	}
end)(SignUpLayout))