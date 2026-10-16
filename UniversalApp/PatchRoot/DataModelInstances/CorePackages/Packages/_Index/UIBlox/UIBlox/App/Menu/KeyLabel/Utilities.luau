local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local FoundationFontFaceMigration = require(Parent3.Parent.Foundation).Utility.Flags.FoundationFontFaceMigration
local _ = require(Parent.Types)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent2.Style.Fonts)
local ImagesModule = require(Parent2.ImageSet.Images)
local GetTextSizeModule = require(Parent3.Core.Text.GetTextSize)
local GetFontFromFontStyleModule = require(Parent3.Core.Text.GetFontFromFontStyle)
local PlatformIconMapModule = require(Parent1.platformIconMap)
local UserInputService = game:GetService("UserInputService")
local DIRECTIONALGAMEPADICONS = PlatformIconMapModule.DIRECTIONAL_GAMEPAD_ICONS
local GAMEPADICONS = PlatformIconMapModule.GAMEPAD_ICONS
local config = {
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
	[Enum.KeyCode.Up] = ImagesModule["icons/controls/keys/arrowUp"],
	[Enum.KeyCode.Down] = ImagesModule["icons/controls/keys/arrowDown"],
	[Enum.KeyCode.Left] = ImagesModule["icons/controls/keys/arrowLeft"],
	[Enum.KeyCode.Right] = ImagesModule["icons/controls/keys/arrowRight"]
}

local function getKeyCodeContent(KeyCode) --[[ Line: 51 ]]
	-- upvalues: DIRECTIONALGAMEPADICONS (copy), GAMEPADICONS (copy), UserInputService (copy), config (copy)
	if type(KeyCode) == "table" then
		return {
			inputType = "gamepad",
			content = DIRECTIONALGAMEPADICONS[KeyCode.key][KeyCode.axis]
		}
	elseif GAMEPADICONS[KeyCode] then
		return { inputType = "gamepad", content = GAMEPADICONS[KeyCode] }
	else
		local StringForKeyCode = UserInputService:GetStringForKeyCode(KeyCode)
		
		return {
			inputType = "keyboard",
			content = config[KeyCode] or (if StringForKeyCode == "" then KeyCode.Name else StringForKeyCode)
		}
	end
end

local function getWidthFromContent(KeyCodeContent, p1) --[[ Line: 68 ]]
	-- upvalues: FoundationFontFaceMigration (copy), GetFontFromFontStyleModule (copy), GetTextSizeModule (copy), ConstantsModule (copy)
	if KeyCodeContent.inputType == "keyboard" then
		if type(KeyCodeContent.content) == "string" then
			local CaptionBody = p1.CaptionBody
			local X = GetTextSizeModule(KeyCodeContent.content, p1.BaseSize * CaptionBody.RelativeSize, if FoundationFontFaceMigration then GetFontFromFontStyleModule(CaptionBody) else CaptionBody.Font, Vector2.zero).X
			
			if ConstantsModule.PREFERRED_WIDTH < X + 2 * ConstantsModule.MIN_SIDE_PADDING then
				return X + 2 * ConstantsModule.SIDE_PADDING
			end
		end
		return ConstantsModule.PREFERRED_WIDTH
	elseif KeyCodeContent.inputType ~= "gamepad" then
		assert(false, string.format("Unreachable: Invalid inputType value: %q", KeyCodeContent.inputType))
		
		return
	else
		local DEFAULTGAMEPADICONSIZE = if typeof(KeyCodeContent.content) == "string" then ConstantsModule.DEFAULT_GAMEPAD_ICON_SIZE else KeyCodeContent.content.ImageRectSize
		
		return DEFAULTGAMEPADICONSIZE.X * ConstantsModule.HEIGHT / DEFAULTGAMEPADICONSIZE.Y
	end
end

function getKeyLabelWidth(p1, p2) --[[ Line: 95 ]]
	-- upvalues: getKeyCodeContent (copy), getWidthFromContent (copy)
	return getWidthFromContent(getKeyCodeContent(p1), p2)
end

return {
	getKeyLabelWidth = getKeyLabelWidth,
	getKeyCodeContent = getKeyCodeContent,
	getWidthFromContent = getWidthFromContent
}