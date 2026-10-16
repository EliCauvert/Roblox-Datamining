local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local FoundationModule = require(Parent2.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local RoactModule = require(Parent2.Roact)
local OtterModule = require(Parent2.Otter)
local TModule = require(Parent2.t)
local IconButtonModule = require(Parent.Button.IconButton)
local ImagesModule = require(Parent.ImageSet.Images)
local IconSizeModule = require(Parent.ImageSet.Enum.IconSize)
local GetIconSizeModule = require(Parent.ImageSet.getIconSize)
local ControlStateModule = require(Parent2.UIBlox.Core.Control.Enum.ControlState)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local ThreeSectionBarModule = require(Parent1.Core.Bar.ThreeSectionBar)
local LerpModule = require(Parent2.UIBlox.Utility.lerp)
local DivideTransparencyModule = require(Parent2.UIBlox.Utility.divideTransparency)
local _UDim2 = UDim2.new(0, 0, 0, -88)
local _UDim2_1 = UDim2.fromOffset(0, 0)
local config = { frequency = 5 }
local FullscreenTitleBar = RoactModule.PureComponent:extend("FullscreenTitleBar")
FullscreenTitleBar.validateProps = TModule.strictInterface({
	title = TModule.string,
	isTriggered = TModule.optional(TModule.boolean),
	onDisappear = TModule.optional(TModule.callback),
	onHover = TModule.optional(TModule.callback),
	exitFullscreen = TModule.optional(TModule.callback),
	closeRoblox = TModule.optional(TModule.callback)
})

function FullscreenTitleBar.init(p1) --[[ Line: 59 ]]
	-- upvalues: RoactModule (copy), ControlStateModule (copy), _UDim2 (copy), _UDim2_1 (copy), OtterModule (copy)
	local v1: number = if p1.props.isTriggered then 1 else 0
	local Binding2
	p1.progress, Binding2 = RoactModule.createBinding(v1)
	p1.exitControlState, p1.setExitControlState = RoactModule.createBinding(ControlStateModule.Default)
	p1.closeControlState, p1.setCloseControlState = RoactModule.createBinding(ControlStateModule.Default)
	p1.titleBarPosition = p1.progress:map(function(p2) --[[ Line: 67 ]]
		-- upvalues: _UDim2 (upval), _UDim2_1 (upval)
		return _UDim2:lerp(_UDim2_1, p2)
	end)
	p1.progressMotor = OtterModule.createSingleMotor(v1)
	p1.progressMotor:onStep(Binding2)
end

function FullscreenTitleBar.render(p1) --[[ Line: 75 ]]
	-- upvalues: WithStyleModule (copy), LerpModule (copy), RoactModule (copy), ControlStateModule (copy), DivideTransparencyModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), IconButtonModule (copy), ImagesModule (copy), IconSizeModule (copy), GetIconSizeModule (copy), ThreeSectionBarModule (copy)
	return WithStyleModule(function(p2) --[[ Line: 76 ]]
		-- upvalues: p1 (copy), LerpModule (upval), RoactModule (upval), ControlStateModule (upval), DivideTransparencyModule (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), IconButtonModule (upval), ImagesModule (upval), IconSizeModule (upval), GetIconSizeModule (upval), ThreeSectionBarModule (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local BackgroundUIDefault = Theme.BackgroundUIDefault
		local TextEmphasis = Theme.TextEmphasis
		local Header2 = _Font.Header2
		local ScaledRelativeSize = Header2.RelativeSize * _Font.BaseSize
		local MapResult = RoactModule.joinBindings({
			progress = p1.progress,
			controlState = p1.exitControlState
		}):map(function(p3) --[[ Line: 94 ]]
			-- upvalues: Theme (copy), ControlStateModule (upval), LerpModule (upval), DivideTransparencyModule (upval)
			return LerpModule(1, DivideTransparencyModule(Theme.ContextualPrimaryDefault.Transparency, if p3.controlState == ControlStateModule.Pressed then 2 else 1), p3.progress)
		end)
		local MapResult1 = RoactModule.joinBindings({
			progress = p1.progress,
			controlState = p1.closeControlState
		}):map(function(p3) --[[ Line: 103 ]]
			-- upvalues: Theme (copy), ControlStateModule (upval), LerpModule (upval), DivideTransparencyModule (upval)
			return LerpModule(1, DivideTransparencyModule(Theme.ContextualPrimaryDefault.Transparency, if p3.controlState == ControlStateModule.Pressed then 2 else 1), p3.progress)
		end)
		local MapResult2 = p1.progress:map(function(p3) --[[ Line: 109 ]]
			-- upvalues: TextEmphasis (copy), LerpModule (upval)
			return LerpModule(1, TextEmphasis.Transparency, p3)
		end)
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = p1.titleBarPosition,
			Size = UDim2.new(1, 0, 0, 88)
		}, {
			BarFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromOffset(0, 0),
				Size = UDim2.new(1, 0, 0, 64),
				[RoactModule.Event.MouseLeave] = p1.props.onDisappear,
				[RoactModule.Event.MouseEnter] = p1.props.onHover
			}, {
				ThreeSectionBar = RoactModule.createElement(ThreeSectionBarModule, {
					barHeight = 64,
					marginLeft = 20,
					marginRight = 20,
					BackgroundColor3 = BackgroundUIDefault.Color,
					BackgroundTransparency = p1.progress:map(function(p3) --[[ Line: 86 ]]
						-- upvalues: BackgroundUIDefault (copy), LerpModule (upval)
						return LerpModule(1, BackgroundUIDefault.Transparency, p3)
					end),
					contentPaddingLeft = UDim.new(0, 12),
					renderLeft = function() --[[ Line: 154 ]]
						-- upvalues: GetIconSizeModule (upval), IconSizeModule (upval), RoactModule (upval)
						local IconSizeModule1 = GetIconSizeModule(IconSizeModule.Medium)
						
						return RoactModule.createFragment({
							First = RoactModule.createElement("ImageLabel", {
								BackgroundTransparency = 1,
								Size = UDim2.fromOffset(IconSizeModule1, IconSizeModule1)
							}),
							Second = RoactModule.createElement("ImageLabel", {
								BackgroundTransparency = 1,
								Size = UDim2.fromOffset(IconSizeModule1, IconSizeModule1)
							})
						})
					end,
					renderCenter = function() --[[ Line: 114 ]]
						-- upvalues: RoactModule (upval), FoundationFontFaceMigration (upval), Header2 (copy), NormalizeFontFaceFunction (upval), ScaledRelativeSize (copy), p1 (upval), TextEmphasis (copy), MapResult2 (copy)
						return RoactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextWrapped = false,
							Font = if FoundationFontFaceMigration then nil else Header2.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Header2.Font) else nil,
							Size = UDim2.new(1, 0, 0, ScaledRelativeSize),
							Text = p1.props.title,
							TextColor3 = TextEmphasis.Color,
							TextSize = ScaledRelativeSize,
							TextTransparency = MapResult2,
							TextTruncate = Enum.TextTruncate.AtEnd
						})
					end,
					contentPaddingRight = UDim.new(0, 12),
					renderRight = function() --[[ Line: 129 ]]
						-- upvalues: RoactModule (upval), IconButtonModule (upval), ImagesModule (upval), IconSizeModule (upval), MapResult (copy), p1 (upval), MapResult1 (copy)
						return RoactModule.createFragment({
							ExitButton = RoactModule.createElement(IconButtonModule, {
								layoutOrder = 1,
								icon = ImagesModule["icons/actions/previewShrink"],
								iconSize = IconSizeModule.Medium,
								iconTransparency = MapResult,
								onActivated = p1.props.exitFullscreen,
								onStateChanged = function(_, p3) --[[ Line: 137 ]]
									-- upvalues: p1 (upval)
									p1.setExitControlState(p3)
								end
							}),
							CloseButton = RoactModule.createElement(IconButtonModule, {
								layoutOrder = 2,
								icon = ImagesModule["icons/navigation/close"],
								iconSize = IconSizeModule.Medium,
								iconTransparency = MapResult1,
								onActivated = p1.props.closeRoblox,
								onStateChanged = function(_, p3) --[[ Line: 147 ]]
									-- upvalues: p1 (upval)
									p1.setCloseControlState(p3)
								end
							})
						})
					end
				})
			}),
			ShadowFrame = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = BackgroundUIDefault.Transparency,
				BackgroundColor3 = BackgroundUIDefault.Color,
				Position = UDim2.fromOffset(0, 64),
				Size = UDim2.new(1, 0, 0, 24)
			}, {
				UIGradient = RoactModule.createElement("UIGradient", {
					Rotation = 90,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
						ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0.75),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			})
		})
	end)
end

function FullscreenTitleBar.didMount(p1) --[[ Line: 218 ]]
	p1.progressMotor:start()
end

function FullscreenTitleBar.didUpdate(p1, p2, _) --[[ Line: 222 ]]
	-- upvalues: OtterModule (copy), config (copy)
	if p2.isTriggered ~= p1.props.isTriggered then
		p1.progressMotor:setGoal(OtterModule.spring(if p1.props.isTriggered then 1 else 0, config))
	end
end

function FullscreenTitleBar.willUnmount(p1) --[[ Line: 229 ]]
	p1.progressMotor:destroy()
end

return FullscreenTitleBar