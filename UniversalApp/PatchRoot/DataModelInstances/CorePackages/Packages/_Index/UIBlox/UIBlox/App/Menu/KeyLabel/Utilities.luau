local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local _ = require(parent.Types)
local constantsModule = require(parent.Constants)
local _ = require(parent_2.Style.Fonts)
local imagesModule = require(parent_2.ImageSet.Images)
local getTextSizeModule = require(parent_3.Core.Text.GetTextSize)
local platformIconMapModule = require(parent_1.platformIconMap)
local userInputService = game:GetService("UserInputService")
local DIRECTIONAL_GAMEPAD_ICONS = platformIconMapModule.DIRECTIONAL_GAMEPAD_ICONS
local GAMEPAD_ICONS = platformIconMapModule.GAMEPAD_ICONS
local t = {
	[Enum.KeyCode.Escape] = "Esc",
	[Enum.KeyCode.Print] = "Prt Sc",
	[Enum.KeyCode.ScrollLock] = "Sc Lock",
	[Enum.KeyCode.Pause] = "Pause",
	[Enum.KeyCode.Insert] = "Ins",
	[Enum.KeyCode.PageUp] = "PgUp",
	[Enum.KeyCode.NumLock] = "Num Lock",
	[Enum.KeyCode.Delete] = "Del",
	[Enum.KeyCode.End] = "End",
	[Enum.KeyCode.PageDown] = "PgDn",
	[Enum.KeyCode.CapsLock] = "Caps",
	[Enum.KeyCode.Return] = "Enter",
	[Enum.KeyCode.LeftShift] = "Shift",
	[Enum.KeyCode.LeftControl] = "Ctrl",
	[Enum.KeyCode.LeftAlt] = "Alt",
	[Enum.KeyCode.Space] = "Space",
	[Enum.KeyCode.LeftMeta] = "Fn",
	[Enum.KeyCode.LeftSuper] = "Cmd",
	[Enum.KeyCode.Tilde] = "~",
	[Enum.KeyCode.Up] = imagesModule["icons/controls/keys/arrowUp"],
	[Enum.KeyCode.Down] = imagesModule["icons/controls/keys/arrowDown"],
	[Enum.KeyCode.Left] = imagesModule["icons/controls/keys/arrowLeft"],
	[Enum.KeyCode.Right] = imagesModule["icons/controls/keys/arrowRight"]
}

local function getKeyCodeContent(p0) --[[ line: 46 ]]
	-- upvalues: DIRECTIONAL_GAMEPAD_ICONS (ref), GAMEPAD_ICONS (ref), userInputService (ref), t (ref)
	if type(p0) == "table" then
		return {
			inputType = "gamepad",
			content = DIRECTIONAL_GAMEPAD_ICONS[p0.key][p0.axis]
		}
	elseif GAMEPAD_ICONS[p0] then
		return { inputType = "gamepad", content = GAMEPAD_ICONS[p0] }
	end
	local var8 = userInputService:GetStringForKeyCode(p0)
	
	return {
		inputType = "keyboard",
		content = t[p0] or (if var8 ~= "" then p0.Name else var8)
	}
end

local function getWidthFromContent(p1, p2) --[[ line: 63 ]]
	-- upvalues: getTextSizeModule (ref), constantsModule (ref)
	if p1.inputType == "keyboard" then
		if type(p1.content) == "string" then
			local captionBody = p2.CaptionBody
			local x = getTextSizeModule(p1.content, p2.BaseSize * captionBody.RelativeSize, captionBody.Font, Vector2.zero).X
			
			return if constantsModule.PREFERRED_WIDTH < x + 2 * constantsModule.MIN_SIDE_PADDING then x + 2 * constantsModule.SIDE_PADDING else constantsModule.PREFERRED_WIDTH
		elseif p1.inputType == "gamepad" then
			local var9 = if typeof(p1.content) == "string" then constantsModule.DEFAULT_GAMEPAD_ICON_SIZE else p1.content.ImageRectSize
			
			return var9.X * constantsModule.HEIGHT / var9.Y
		end
		assert(false, string.format("Unreachable: Invalid inputType value: %q", p1.inputType))
	end
end

function getKeyLabelWidth(p3, p4) --[[ line: 87 ]]
	-- upvalues: getKeyCodeContent (ref), getWidthFromContent (ref)
	return getWidthFromContent(getKeyCodeContent(p3), p4)
end

return {
	getKeyLabelWidth = getKeyLabelWidth,
	getKeyCodeContent = getKeyCodeContent,
	getWidthFromContent = getWidthFromContent
}