local CorePackages = game:GetService("CorePackages")
local Shell = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local ContextActionService = game:GetService("ContextActionService")
local TextService = game:GetService("TextService")
local GlobalSettingsModule = require(Shell:FindFirstChild("GlobalSettings"))
local UtilityModule = require(Shell:FindFirstChild("Utility"))
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local GetFFlagDebugLuaAppAlwaysUseGamepadFunction = require(CorePackages.Workspace.Packages.SharedFlags).getFFlagDebugLuaAppAlwaysUseGamepad

return function(Parent, ActionName: string, Vector: UDim2)
	-- upvalues: CreateFunction (copy), GlobalSettingsModule (copy), TextService (copy), UtilityModule (copy), ContextActionService (copy), GetFFlagDebugLuaAppAlwaysUseGamepadFunction (copy), RoactGamepadModule (copy)
	if Vector == nil then
		Vector = UDim2.new(1, -1, 1, -1)
	end
	local t = {}
	
	if ActionName == nil or #ActionName == 0 then
		ActionName = "DefaultHintAction"
	end
	local Parent1 = CreateFunction("Frame")({
		Name = "HintActionContainer",
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 0, 0),
		Parent = Parent
	})
	local Label = CreateFunction("TextLabel")({
		Name = "HintActionText",
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = 10,
		Font = GlobalSettingsModule.RegularFont,
		FontSize = GlobalSettingsModule.TitleSize,
		TextColor3 = GlobalSettingsModule.WhiteTextColor,
		TextXAlignment = Enum.TextXAlignment.Right,
		Parent = Parent1
	})
	local Image = CreateFunction("ImageLabel")({
		Name = "HintActionImage",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 10,
		Size = UDim2.new(0, 83, 0, 83),
		Parent = Parent1
	})
	
	local function updateLayout()
		-- upvalues: TextService (upval), Label (copy), UtilityModule (upval), Image (copy), Parent1 (copy), Vector (ref)
		local TextSize = TextService:GetTextSize(Label.Text, UtilityModule.ConvertFontSizeEnumToInt(Label.FontSize), Label.Font, Vector2.new(0, 0))
		Label.Size = UDim2.new(0, TextSize.x, 0, Image.Size.Y.Offset)
		Label.Position = UDim2.new(1, -TextSize.x, 0, -4)
		Parent1.Size = UDim2.new(0, TextSize.x + Image.Size.X.Offset + 8, 0, Image.Size.Y.Offset)
		Parent1.Position = UDim2.new(Vector.X.Scale, Vector.X.Offset * Parent1.Size.X.Offset, Vector.Y.Scale, Vector.Y.Offset * Parent1.Size.Y.Offset)
	end
	
	function t:BindAction(FunctionToBind, p1)
		-- upvalues: ContextActionService (upval), ActionName (ref), GetFFlagDebugLuaAppAlwaysUseGamepadFunction (upval), RoactGamepadModule (upval)
		if not FunctionToBind then return end
		ContextActionService:UnbindCoreAction(ActionName)
		
		if GetFFlagDebugLuaAppAlwaysUseGamepadFunction() and RoactGamepadModule.Config.DebugKeyboardBindings then
			ContextActionService:BindCoreAction(ActionName, FunctionToBind, false, p1, table.unpack(RoactGamepadModule.Config.DebugKeyboardBindings[p1] or {}))
			
			return
		else
			ContextActionService:BindCoreAction(ActionName, FunctionToBind, false, p1)
		end
	end
	
	function t:UnbindAction()
		-- upvalues: ContextActionService (upval), ActionName (ref)
		ContextActionService:UnbindCoreAction(ActionName)
	end
	
	function t:SetParent(Parent)
		-- upvalues: Parent1 (copy)
		Parent1.Parent = Parent
	end
	
	function t:SetVisible(Visible)
		-- upvalues: Parent1 (copy)
		Parent1.Visible = Visible
	end
	
	function t:SetTransparency(ImageTransparency)
		-- upvalues: Label (copy), Image (copy)
		Label.TextTransparency = ImageTransparency
		Image.ImageTransparency = ImageTransparency
	end
	
	function t:SetVisibleWithTween(p1)
		-- upvalues: UtilityModule (upval), Label (copy), Image (copy)
		UtilityModule.PropertyTweener(Label, "TextTransparency", Label.TextTransparency, p1, 0.25, UtilityModule.EaseOutQuad, true)
		UtilityModule.PropertyTweener(Image, "ImageTransparency", Image.ImageTransparency, p1, 0.25, UtilityModule.EaseOutQuad, true)
	end
	
	function t:SetText(Text)
		-- upvalues: Label (copy), updateLayout (copy)
		if Text ~= Label.Text then
			Label.Text = Text
			updateLayout()
			
			return
		end
	end
	
	function t:SetImage(Image1)
		-- upvalues: Image (copy)
		if Image1 ~= Image.Image then
			Image.Image = Image1
			
			return
		end
	end
	
	return t
end