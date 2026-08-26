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

function fullscreenTitleBar.init(p1)
	-- upvalues: roactModule (ref), controlStateModule (ref), uDim2 (ref), uDim2_1 (ref), otterModule (ref)
	local var1 = if p1.props.isTriggered then 1 else 0
	local _ = nil
	local var2, var3 = roactModule.createBinding(var1)
	p1.progress = var2
	local var4, var5 = roactModule.createBinding(controlStateModule.Default)
	p1.exitControlState = var4
	p1.setExitControlState = var5
	local var6, var7 = roactModule.createBinding(controlStateModule.Default)
	p1.closeControlState = var6
	p1.setCloseControlState = var7
	p1.titleBarPosition = p1.progress:map(function(p2)
		-- upvalues: uDim2 (copy), uDim2_1 (copy)
		return uDim2:lerp(uDim2_1, p2)
	end)
	p1.progressMotor = otterModule.createSingleMotor(var1)
	p1.progressMotor:onStep(var3)
end

function fullscreenTitleBar.render(p1)
	-- upvalues: withStyleModule (ref), lerpModule (ref), roactModule (ref), controlStateModule (ref), divideTransparencyModule (ref), iconButtonModule (ref), imagesModule (ref), iconSizeModule (ref), getIconSizeModule (ref), threeSectionBarModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), lerpModule (copy), roactModule (copy), controlStateModule (copy), divideTransparencyModule (copy), iconButtonModule (copy), imagesModule (copy), iconSizeModule (copy), getIconSizeModule (copy), threeSectionBarModule (copy)
		local theme = p2.Theme
		local font = p2.Font
		local backgroundUIDefault = theme.BackgroundUIDefault
		local textEmphasis = theme.TextEmphasis
		local header2 = font.Header2
		local var1 = header2.RelativeSize * font.BaseSize
		local var2 = p1.progress:map(function(p3)
			-- upvalues: backgroundUIDefault (ref), lerpModule (copy)
			return lerpModule(1, backgroundUIDefault.Transparency, p3)
		end)
		local var3 = roactModule.joinBindings({
			progress = p1.progress,
			controlState = p1.exitControlState
		}):map(function(p3)
			-- upvalues: theme (ref), controlStateModule (copy), lerpModule (copy), divideTransparencyModule (copy)
			return lerpModule(1, divideTransparencyModule(theme.ContextualPrimaryDefault.Transparency, if p3.controlState == controlStateModule.Pressed then 2 else 1), p3.progress)
		end)
		local var4 = roactModule.joinBindings({
			progress = p1.progress,
			controlState = p1.closeControlState
		}):map(function(p3)
			-- upvalues: theme (ref), controlStateModule (copy), lerpModule (copy), divideTransparencyModule (copy)
			return lerpModule(1, divideTransparencyModule(theme.ContextualPrimaryDefault.Transparency, if p3.controlState == controlStateModule.Pressed then 2 else 1), p3.progress)
		end)
		local var5 = p1.progress:map(function(p3)
			-- upvalues: textEmphasis (ref), lerpModule (copy)
			return lerpModule(1, textEmphasis.Transparency, p3)
		end)
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = p1.titleBarPosition,
			Size = UDim2.new(1, 0, 0, 88)
		}, {
			BarFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromOffset(0, 0),
				Size = UDim2.new(1, 0, 0, 64),
				[roactModule.Event.MouseLeave] = p1.props.onDisappear,
				[roactModule.Event.MouseEnter] = p1.props.onHover
			}, {
				ThreeSectionBar = roactModule.createElement(threeSectionBarModule, {
					barHeight = 64,
					marginLeft = 20,
					marginRight = 20,
					BackgroundColor3 = backgroundUIDefault.Color,
					BackgroundTransparency = var2,
					contentPaddingLeft = UDim.new(0, 12),
					renderLeft = function()
						-- upvalues: getIconSizeModule (copy), iconSizeModule (copy), roactModule (copy)
						local var6 = getIconSizeModule(iconSizeModule.Medium)
						
						return roactModule.createFragment({
							First = roactModule.createElement("ImageLabel", {
								BackgroundTransparency = 1,
								Size = UDim2.fromOffset(var6, var6)
							}),
							Second = roactModule.createElement("ImageLabel", {
								BackgroundTransparency = 1,
								Size = UDim2.fromOffset(var6, var6)
							})
						})
					end,
					renderCenter = function()
						-- upvalues: roactModule (copy), header2 (ref), var1 (ref), p1 (copy), textEmphasis (ref), var5 (ref)
						return roactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextWrapped = false,
							Font = header2.Font,
							Size = UDim2.new(1, 0, 0, var1),
							Text = p1.props.title,
							TextColor3 = textEmphasis.Color,
							TextSize = var1,
							TextTransparency = var5,
							TextTruncate = Enum.TextTruncate.AtEnd
						})
					end,
					contentPaddingRight = UDim.new(0, 12),
					renderRight = function()
						-- upvalues: roactModule (copy), iconButtonModule (copy), imagesModule (copy), iconSizeModule (copy), var3 (ref), p1 (copy), var4 (ref)
						return roactModule.createFragment({
							ExitButton = roactModule.createElement(iconButtonModule, {
								layoutOrder = 1,
								icon = imagesModule["icons/actions/previewShrink"],
								iconSize = iconSizeModule.Medium,
								iconTransparency = var3,
								onActivated = p1.props.exitFullscreen,
								onStateChanged = function(_, p3)
									-- upvalues: p1 (copy)
									p1.setExitControlState(p3)
								end
							}),
							CloseButton = roactModule.createElement(iconButtonModule, {
								layoutOrder = 2,
								icon = imagesModule["icons/navigation/close"],
								iconSize = iconSizeModule.Medium,
								iconTransparency = var4,
								onActivated = p1.props.closeRoblox,
								onStateChanged = function(_, p3)
									-- upvalues: p1 (copy)
									p1.setCloseControlState(p3)
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

function fullscreenTitleBar.didMount(p1)
	p1.progressMotor:start()
end

function fullscreenTitleBar.didUpdate(p1, p2, _)
	-- upvalues: otterModule (ref), t (ref)
	if p2.isTriggered ~= p1.props.isTriggered then
		p1.progressMotor:setGoal(otterModule.spring(if p1.props.isTriggered then 1 else 0, t))
	end
end

function fullscreenTitleBar.willUnmount(p1)
	p1.progressMotor:destroy()
end

return fullscreenTitleBar