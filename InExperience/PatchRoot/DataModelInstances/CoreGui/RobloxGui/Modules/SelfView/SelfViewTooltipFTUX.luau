local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local coreGuiService = game:GetService("CoreGui")
local _ = coreGuiService:WaitForChild("RobloxGui")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local promiseModule = require(corePackagesService.Packages.Promise)

return function(p1)
	-- upvalues: reactModule (ref), robloxTranslatorModule (ref), coreGuiService (ref), tooltipOrientation (ref), userInputService (ref), promiseModule (ref), withTooltip (ref)
	local var1, var2 = reactModule.useState(true)
	local fallbackText = p1.fallbackText
	pcall(function()
		-- upvalues: fallbackText (write), robloxTranslatorModule (copy), p1 (ref)
		fallbackText = robloxTranslatorModule:FormatByKey(p1.translationKey)
	end)
	local t = {
		textAlignment = Enum.TextXAlignment.Left,
		bodyText = fallbackText
	}
	local t_1 = {
		DisplayOrder = 10,
		active = var1,
		guiTarget = coreGuiService,
		preferredOrientation = tooltipOrientation.Left
	}
	local inputBeganConnection = nil
	
	local _ = function()
		-- upvalues: var2 (ref), inputBeganConnection (write)
		var2(false)
		
		if inputBeganConnection then
			inputBeganConnection:Disconnect()
			inputBeganConnection = nil
		end
	end
	
	inputBeganConnection = userInputService.InputBegan:Connect(function(p2)
		-- upvalues: var2 (ref), inputBeganConnection (write)
		local userInputType = p2.UserInputType
		
		if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch then
			var2(false)
			
			if inputBeganConnection then
				inputBeganConnection:Disconnect()
				inputBeganConnection = nil
			end
		end
	end)
	promiseModule.delay(p1.tooltipLifetime):andThen(function()
		-- upvalues: var2 (ref), inputBeganConnection (write)
		var2(false)
		
		if inputBeganConnection then
			inputBeganConnection:Disconnect()
			inputBeganConnection = nil
		end
	end)
	
	return withTooltip(t, t_1, function(p2)
		-- upvalues: reactModule (copy)
		local var3 = function(p3)
			-- upvalues: p2 (ref)
			p2(p3)
		end
		
		return reactModule.createElement("Frame", {
			Visible = false,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			[reactModule.Change.AbsoluteSize] = var3,
			[reactModule.Change.AbsolutePosition] = var3
		})
	end)
end