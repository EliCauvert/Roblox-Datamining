-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:56 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local reactModule = require(parent_3.React)
local luauPolyfillModule = require(parent_3.LuauPolyfill)
local _ = require(parent.Types)
local constantsModule = require(parent.Constants)
local utilitiesModule = require(parent.Utilities)
local useStyleModule = require(parent_2.Core.Style.useStyle)
local imagesModule = require(parent_1.ImageSet.Images)
local label = require(parent_2.Core.ImageSet.ImageSetComponent).Label

return function(p0) --[[ line: 40 | named "KeyLabel" ]]
	-- upvalues: useStyleModule (ref), constantsModule (ref), utilitiesModule (ref), reactModule (ref), imagesModule (ref), label (ref), luauPolyfillModule (ref)
	local var6 = useStyleModule()
	local var7 = var6.Theme[p0.iconThemeKey or constantsModule.DEFAULT_ICON_THEME]
	local keyCodeContent = utilitiesModule.getKeyCodeContent(p0.keyCode)
	local t = {
		AnchorPoint = p0.AnchorPoint,
		Position = p0.Position,
		LayoutOrder = p0.LayoutOrder,
		ZIndex = p0.ZIndex,
		[reactModule.Change.AbsoluteSize] = p0[reactModule.Change.AbsoluteSize],
		Size = UDim2.fromOffset(utilitiesModule.getWidthFromContent(keyCodeContent, var6.Font), constantsModule.HEIGHT)
	}
	
	if keyCodeContent.inputType == "keyboard" then
		local var10 = var6.Theme[p0.textThemeKey or constantsModule.DEFAULT_TEXT_THEME]
		local font = var6.Font
		local captionHeader = font.CaptionHeader
		local var11 = font.BaseSize * captionHeader.RelativeSize
		local var12 = ""
		local var13 = nil
		
		if type(keyCodeContent.content) == "string" then
			var12 = keyCodeContent.content
		else
			local var14 = keyCodeContent.content.ImageRectSize / imagesModule.ImagesResolutionScale
			var13 = reactModule.createElement(label, {
				BackgroundTransparency = 1,
				Image = keyCodeContent.content,
				ImageColor3 = var10.Color,
				ImageTransparency = var10.Transparency,
				Size = UDim2.fromOffset(var14.X, var14.Y),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			})
		end
		return reactModule.createElement(label, luauPolyfillModule.Object.assign(t, {
			BackgroundTransparency = 1,
			ImageTransparency = var7.Transparency,
			ImageColor3 = var7.Color,
			Image = imagesModule["icons/controls/keys/key_single"],
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(Vector2.new(10, 9), Vector2.new(25, 25))
		}), {
			LabelContent = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				RichText = false,
				Text = var12,
				TextColor3 = var10.Color,
				TextTransparency = var10.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextSize = var11,
				Font = captionHeader.Font,
				Position = UDim2.fromOffset(0, constantsModule.TEXT_CENTER_OFFSET),
				Size = UDim2.fromScale(1, 1)
			}, { Icon = var13 })
		})
	elseif keyCodeContent.inputType == "gamepad" then
		return reactModule.createElement(label, luauPolyfillModule.Object.assign(t, {
			BackgroundTransparency = 1,
			Image = keyCodeContent.content,
			ImageColor3 = var7.Color,
			ImageTransparency = var7.Transparency
		}))
	end
	assert(false, string.format("Unreachable: Invalid inputType value: \"%s\"", keyCodeContent.inputType))
end