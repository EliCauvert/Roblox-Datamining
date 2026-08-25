local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local otterModule = require(parent_2.Otter)
local tModule = require(parent_2.t)
local iconButtonModule = require(parent.Button.IconButton)
local imagesModule = require(parent.ImageSet.Images)
local iconSizeModule = require(parent.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent.ImageSet.getIconSize)
local controlStateModule = require(parent_2.UIBlox.Core.Control.Enum.ControlState)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local threeSectionBarModule = require(parent_1.Core.Bar.ThreeSectionBar)
local lerpModule = require(parent_2.UIBlox.Utility.lerp)
local divideTransparencyModule = require(parent_2.UIBlox.Utility.divideTransparency)
local uDim2 = UDim2.new(0, 0, 0, -88)
local uDim2_1 = UDim2.fromOffset(0, 0)
local t = { frequency = 5 }
local fullscreenTitleBar = roactModule.PureComponent:extend("FullscreenTitleBar")
fullscreenTitleBar.validateProps = tModule.strictInterface({
	title = tModule.string,
	isTriggered = tModule.optional(tModule.boolean),
	onDisappear = tModule.optional(tModule.callback),
	onHover = tModule.optional(tModule.callback),
	exitFullscreen = tModule.optional(tModule.callback),
	closeRoblox = tModule.optional(tModule.callback)
})

function fullscreenTitleBar.init(p0)
	-- upvalues: roactModule (ref), controlStateModule (ref), uDim2 (ref), uDim2_1 (ref), otterModule (ref)
	local var16 = if p0.props.isTriggered then 1 else 0
	local _ = nil
	local var17, var18 = roactModule.createBinding(var16)
	p0.progress = var17
	local var19, var20 = roactModule.createBinding(controlStateModule.Default)
	p0.exitControlState = var19
	p0.setExitControlState = var20
	local var21, var22 = roactModule.createBinding(controlStateModule.Default)
	p0.closeControlState = var21
	p0.setCloseControlState = var22
	p0.titleBarPosition = p0.progress:map(function(p1)
		-- upvalues: uDim2 (copy), uDim2_1 (copy)
		return uDim2:lerp(uDim2_1, p1)
	end)
	p0.progressMotor = otterModule.createSingleMotor(var16)
	p0.progressMotor:onStep(var18)
end

function fullscreenTitleBar.render(p2)
	-- upvalues: withStyleModule (ref), lerpModule (ref), roactModule (ref), controlStateModule (ref), divideTransparencyModule (ref), iconButtonModule (ref), imagesModule (ref), iconSizeModule (ref), getIconSizeModule (ref), threeSectionBarModule (ref)
	return withStyleModule(function(p3)
		-- upvalues: p2 (ref), lerpModule (copy), roactModule (copy), controlStateModule (copy), divideTransparencyModule (copy), iconButtonModule (copy), imagesModule (copy), iconSizeModule (copy), getIconSizeModule (copy), threeSectionBarModule (copy)
		local theme = p3.Theme
		local font = p3.Font
		local backgroundUIDefault = theme.BackgroundUIDefault
		local textEmphasis = theme.TextEmphasis
		local header2 = font.Header2
		local var23 = header2.RelativeSize * font.BaseSize
		local var24 = p2.progress:map(function(p4)
			-- upvalues: backgroundUIDefault (ref), lerpModule (copy)
			return lerpModule(1, backgroundUIDefault.Transparency, p4)
		end)
		local var25 = roactModule.joinBindings({
			progress = p2.progress,
			controlState = p2.exitControlState
		}):map(function(p5)
			-- upvalues: theme (ref), controlStateModule (copy), lerpModule (copy), divideTransparencyModule (copy)
			return lerpModule(1, divideTransparencyModule(theme.ContextualPrimaryDefault.Transparency, if p5.controlState == controlStateModule.Pressed then 2 else 1), p5.progress)
		end)
		local var26 = roactModule.joinBindings({
			progress = p2.progress,
			controlState = p2.closeControlState
		}):map(function(p6)
			-- upvalues: theme (ref), controlStateModule (copy), lerpModule (copy), divideTransparencyModule (copy)
			return lerpModule(1, divideTransparencyModule(theme.ContextualPrimaryDefault.Transparency, if p6.controlState == controlStateModule.Pressed then 2 else 1), p6.progress)
		end)
		local var27 = p2.progress:map(function(p7)
			-- upvalues: textEmphasis (ref), lerpModule (copy)
			return lerpModule(1, textEmphasis.Transparency, p7)
		end)
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = p2.titleBarPosition,
			Size = UDim2.new(1, 0, 0, 88)
		}, {
			BarFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromOffset(0, 0),
				Size = UDim2.new(1, 0, 0, 64),
				[roactModule.Event.MouseLeave] = p2.props.onDisappear,
				[roactModule.Event.MouseEnter] = p2.props.onHover
			}, {
				ThreeSectionBar = roactModule.createElement(threeSectionBarModule, {
					barHeight = 64,
					marginLeft = 20,
					marginRight = 20,
					BackgroundColor3 = backgroundUIDefault.Color,
					BackgroundTransparency = var24,
					contentPaddingLeft = UDim.new(0, 12),
					renderLeft = function()
						-- upvalues: getIconSizeModule (copy), iconSizeModule (copy), roactModule (copy)
						local var28 = getIconSizeModule(iconSizeModule.Medium)
						
						return roactModule.createFragment({
							First = roactModule.createElement("ImageLabel", {
								BackgroundTransparency = 1,
								Size = UDim2.fromOffset(var28, var28)
							}),
							Second = roactModule.createElement("ImageLabel", {
								BackgroundTransparency = 1,
								Size = UDim2.fromOffset(var28, var28)
							})
						})
					end,
					renderCenter = function()
						-- upvalues: roactModule (copy), header2 (ref), var23 (ref), p2 (copy), textEmphasis (ref), var27 (ref)
						return roactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextWrapped = false,
							Font = header2.Font,
							Size = UDim2.new(1, 0, 0, var23),
							Text = p2.props.title,
							TextColor3 = textEmphasis.Color,
							TextSize = var23,
							TextTransparency = var27,
							TextTruncate = Enum.TextTruncate.AtEnd
						})
					end,
					contentPaddingRight = UDim.new(0, 12),
					renderRight = function()
						-- upvalues: roactModule (copy), iconButtonModule (copy), imagesModule (copy), iconSizeModule (copy), var25 (ref), p2 (copy), var26 (ref)
						return roactModule.createFragment({
							ExitButton = roactModule.createElement(iconButtonModule, {
								layoutOrder = 1,
								icon = imagesModule["icons/actions/previewShrink"],
								iconSize = iconSizeModule.Medium,
								iconTransparency = var25,
								onActivated = p2.props.exitFullscreen,
								onStateChanged = function(_, p8)
									-- upvalues: p2 (copy)
									p2.setExitControlState(p8)
								end
							}),
							CloseButton = roactModule.createElement(iconButtonModule, {
								layoutOrder = 2,
								icon = imagesModule["icons/navigation/close"],
								iconSize = iconSizeModule.Medium,
								iconTransparency = var26,
								onActivated = p2.props.closeRoblox,
								onStateChanged = function(_, p9)
									-- upvalues: p2 (copy)
									p2.setCloseControlState(p9)
								end
							})
						})
					end
				})
			}),
			ShadowFrame = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = backgroundUIDefault.Transparency,
				BackgroundColor3 = backgroundUIDefault.Color,
				Position = UDim2.fromOffset(0, 64),
				Size = UDim2.new(1, 0, 0, 24)
			}, {
				UIGradient = roactModule.createElement("UIGradient", {
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

function fullscreenTitleBar.didMount(p10)
	p10.progressMotor:start()
end

function fullscreenTitleBar.didUpdate(p11, p12, _)
	-- upvalues: otterModule (ref), t (ref)
	if p12.isTriggered ~= p11.props.isTriggered then
		p11.progressMotor:setGoal(otterModule.spring(if p11.props.isTriggered then 1 else 0, t))
	end
end

function fullscreenTitleBar.willUnmount(p13)
	p13.progressMotor:destroy()
end

return fullscreenTitleBar