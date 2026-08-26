local corePackagesService = game:GetService("CorePackages")
local shell = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local contextActionService = game:GetService("ContextActionService")
local textService = game:GetService("TextService")
local globalSettingsModule = require(shell:FindFirstChild("GlobalSettings"))
local utilityModule = require(shell:FindFirstChild("Utility"))
local roactGamepadModule = require(corePackagesService.Packages.RoactGamepad)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local getFFlagDebugLuaAppAlwaysUseGamepad = require(corePackagesService.Workspace.Packages.SharedFlags).getFFlagDebugLuaAppAlwaysUseGamepad

return function(p1, p2, p3)
	-- upvalues: create (ref), globalSettingsModule (ref), textService (ref), utilityModule (ref), contextActionService (ref), getFFlagDebugLuaAppAlwaysUseGamepad (ref), roactGamepadModule (ref)
	if p3 == nil then
		p3 = UDim2.new(1, -1, 1, -1)
	end
	local t = {}
	
	if p2 == nil or #p2 == 0 then
		p2 = "DefaultHintAction"
	end
	local var1 = create("Frame")({
		Name = "HintActionContainer",
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 0, 0),
		Parent = p1
	})
	local var2 = create("TextLabel")({
		Name = "HintActionText",
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = 10,
		Font = globalSettingsModule.RegularFont,
		FontSize = globalSettingsModule.TitleSize,
		TextColor3 = globalSettingsModule.WhiteTextColor,
		TextXAlignment = Enum.TextXAlignment.Right,
		Parent = var1
	})
	local var3 = create("ImageLabel")({
		Name = "HintActionImage",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 10,
		Size = UDim2.new(0, 83, 0, 83),
		Parent = var1
	})
	
	local function updateLayout()
		-- upvalues: textService (copy), var2 (ref), utilityModule (copy), var3 (ref), var1 (ref), p3 (write)
		local textTextSize = textService:GetTextSize(var2.Text, utilityModule.ConvertFontSizeEnumToInt(var2.FontSize), var2.Font, Vector2.new(0, 0))
		var2.Size = UDim2.new(0, textTextSize.x, 0, var3.Size.Y.Offset)
		var2.Position = UDim2.new(1, -textTextSize.x, 0, -4)
		var1.Size = UDim2.new(0, textTextSize.x + var3.Size.X.Offset + 8, 0, var3.Size.Y.Offset)
		var1.Position = UDim2.new(p3.X.Scale, p3.X.Offset * var1.Size.X.Offset, p3.Y.Scale, p3.Y.Offset * var1.Size.Y.Offset)
	end
	
	function t.BindAction(_, p4, p5)
		-- upvalues: contextActionService (copy), p2 (write), getFFlagDebugLuaAppAlwaysUseGamepad (copy), roactGamepadModule (copy)
		if not p4 then return end
		contextActionService:UnbindCoreAction(p2)
		
		if getFFlagDebugLuaAppAlwaysUseGamepad() and roactGamepadModule.Config.DebugKeyboardBindings then
			contextActionService:BindCoreAction(p2, p4, false, p5, table.unpack(roactGamepadModule.Config.DebugKeyboardBindings[p5] or {}))
			
			return
		end
		contextActionService:BindCoreAction(p2, p4, false, p5)
	end
	
	function t.UnbindAction(_)
		-- upvalues: contextActionService (copy), p2 (write)
		contextActionService:UnbindCoreAction(p2)
	end
	
	function t.SetParent(_, p4)
		-- upvalues: var1 (ref)
		var1.Parent = p4
	end
	
	function t.SetVisible(_, p4)
		-- upvalues: var1 (ref)
		var1.Visible = p4
	end
	
	function t.SetTransparency(_, p4)
		-- upvalues: var2 (ref), var3 (ref)
		var2.TextTransparency = p4
		var3.ImageTransparency = p4
	end
	
	function t.SetVisibleWithTween(_, p4)
		-- upvalues: utilityModule (copy), var2 (ref), var3 (ref)
		utilityModule.PropertyTweener(var2, "TextTransparency", var2.TextTransparency, p4, 0.25, utilityModule.EaseOutQuad, true)
		utilityModule.PropertyTweener(var3, "ImageTransparency", var3.ImageTransparency, p4, 0.25, utilityModule.EaseOutQuad, true)
	end
	
	function t.SetText(_, p4)
		-- upvalues: var2 (ref), updateLayout (ref)
		if p4 == var2.Text then
			return
		end
		var2.Text = p4
		updateLayout()
	end
	
	function t.SetImage(_, p4)
		-- upvalues: var3 (ref)
		if p4 == var3.Image then
			return
		end
		var3.Image = p4
	end
	
	return t
end