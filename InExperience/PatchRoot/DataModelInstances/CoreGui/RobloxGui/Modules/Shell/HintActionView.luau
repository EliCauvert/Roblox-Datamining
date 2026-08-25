local corePackagesService = game:GetService("CorePackages")
local shell = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local contextActionService = game:GetService("ContextActionService")
local textService = game:GetService("TextService")
local globalSettingsModule = require(shell:FindFirstChild("GlobalSettings"))
local utilityModule = require(shell:FindFirstChild("Utility"))
local roactGamepadModule = require(corePackagesService.Packages.RoactGamepad)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local getFFlagDebugLuaAppAlwaysUseGamepad = require(corePackagesService.Workspace.Packages.SharedFlags).getFFlagDebugLuaAppAlwaysUseGamepad

return function(p0, p1, p2)
	-- upvalues: create (ref), globalSettingsModule (ref), textService (ref), utilityModule (ref), contextActionService (ref), getFFlagDebugLuaAppAlwaysUseGamepad (ref), roactGamepadModule (ref)
	if p2 == nil then
		p2 = UDim2.new(1, -1, 1, -1)
	end
	local t = {}
	
	if p1 == nil or #p1 == 0 then
		p1 = "DefaultHintAction"
	end
	local var8 = create("Frame")({
		Name = "HintActionContainer",
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 0, 0),
		Parent = p0
	})
	local var9 = create("TextLabel")({
		Name = "HintActionText",
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = 10,
		Font = globalSettingsModule.RegularFont,
		FontSize = globalSettingsModule.TitleSize,
		TextColor3 = globalSettingsModule.WhiteTextColor,
		TextXAlignment = Enum.TextXAlignment.Right,
		Parent = var8
	})
	local var10 = create("ImageLabel")({
		Name = "HintActionImage",
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 10,
		Size = UDim2.new(0, 83, 0, 83),
		Parent = var8
	})
	
	local function updateLayout()
		-- upvalues: textService (copy), var9 (ref), utilityModule (copy), var10 (ref), var8 (ref), p2 (write)
		local textTextSize = textService:GetTextSize(var9.Text, utilityModule.ConvertFontSizeEnumToInt(var9.FontSize), var9.Font, Vector2.new(0, 0))
		var9.Size = UDim2.new(0, textTextSize.x, 0, var10.Size.Y.Offset)
		var9.Position = UDim2.new(1, -textTextSize.x, 0, -4)
		var8.Size = UDim2.new(0, textTextSize.x + var10.Size.X.Offset + 8, 0, var10.Size.Y.Offset)
		var8.Position = UDim2.new(p2.X.Scale, p2.X.Offset * var8.Size.X.Offset, p2.Y.Scale, p2.Y.Offset * var8.Size.Y.Offset)
	end
	
	function t.BindAction(_, p3, p4)
		-- upvalues: contextActionService (copy), p1 (write), getFFlagDebugLuaAppAlwaysUseGamepad (copy), roactGamepadModule (copy)
		if not p3 then return end
		contextActionService:UnbindCoreAction(p1)
		
		if getFFlagDebugLuaAppAlwaysUseGamepad() and roactGamepadModule.Config.DebugKeyboardBindings then
			contextActionService:BindCoreAction(p1, p3, false, p4, table.unpack(roactGamepadModule.Config.DebugKeyboardBindings[p4] or {}))
			
			return
		end
		contextActionService:BindCoreAction(p1, p3, false, p4)
	end
	
	function t.UnbindAction(_)
		-- upvalues: contextActionService (copy), p1 (write)
		contextActionService:UnbindCoreAction(p1)
	end
	
	function t.SetParent(_, p5)
		-- upvalues: var8 (ref)
		var8.Parent = p5
	end
	
	function t.SetVisible(_, p6)
		-- upvalues: var8 (ref)
		var8.Visible = p6
	end
	
	function t.SetTransparency(_, p7)
		-- upvalues: var9 (ref), var10 (ref)
		var9.TextTransparency = p7
		var10.ImageTransparency = p7
	end
	
	function t.SetVisibleWithTween(_, p8)
		-- upvalues: utilityModule (copy), var9 (ref), var10 (ref)
		utilityModule.PropertyTweener(var9, "TextTransparency", var9.TextTransparency, p8, 0.25, utilityModule.EaseOutQuad, true)
		utilityModule.PropertyTweener(var10, "ImageTransparency", var10.ImageTransparency, p8, 0.25, utilityModule.EaseOutQuad, true)
	end
	
	function t.SetText(_, p9)
		-- upvalues: var9 (ref), updateLayout (ref)
		if p9 == var9.Text then
			return
		end
		var9.Text = p9
		updateLayout()
	end
	
	function t.SetImage(_, p10)
		-- upvalues: var10 (ref)
		if p10 == var10.Image then
			return
		end
		var10.Image = p10
	end
	
	return t
end