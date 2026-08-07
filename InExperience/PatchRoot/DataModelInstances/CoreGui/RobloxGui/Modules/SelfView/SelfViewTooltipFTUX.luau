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

return function(p0) --[[ line: 15 ]]
	-- upvalues: reactModule (ref), robloxTranslatorModule (ref), coreGuiService (ref), tooltipOrientation (ref), userInputService (ref), promiseModule (ref), withTooltip (ref)
	local var7, var8 = reactModule.useState(true)
	local fallbackText = p0.fallbackText
	pcall(function() --[[ line: 19 ]]
		-- upvalues: fallbackText (write), robloxTranslatorModule (copy), p0 (ref)
		fallbackText = robloxTranslatorModule:FormatByKey(p0.translationKey)
	end)
	local t = {
		textAlignment = Enum.TextXAlignment.Left,
		bodyText = fallbackText
	}
	local t_1 = {
		DisplayOrder = 10,
		active = var7,
		guiTarget = coreGuiService,
		preferredOrientation = tooltipOrientation.Left
	}
	local inputBeganConnection = nil
	
	local _ = function() --[[ line: 35 ]]
		-- upvalues: var8 (ref), inputBeganConnection (write)
		var8(false)
		
		if inputBeganConnection then
			inputBeganConnection:Disconnect()
			inputBeganConnection = nil
		end
	end
	
	inputBeganConnection = userInputService.InputBegan:Connect(function(p1) --[[ line: 44 ]]
		-- upvalues: var8 (ref), inputBeganConnection (write)
		local userInputType = p1.UserInputType
		
		if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch then
			var8(false)
			
			if inputBeganConnection then
				inputBeganConnection:Disconnect()
				inputBeganConnection = nil
			end
		end
	end)
	promiseModule.delay(p0.tooltipLifetime):andThen(function() --[[ line: 50 ]]
		-- upvalues: var8 (ref), inputBeganConnection (write)
		var8(false)
		
		if inputBeganConnection then
			inputBeganConnection:Disconnect()
			inputBeganConnection = nil
		end
	end)
	
	return withTooltip(t, t_1, function(p2) --[[ line: 54 ]]
		-- upvalues: reactModule (copy)
		local var12 = function(p3) --[[ line: 55 ]]
			-- upvalues: p2 (ref)
			p2(p3)
		end
		
		return reactModule.createElement("Frame", {
			Visible = false,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			[reactModule.Change.AbsoluteSize] = var12,
			[reactModule.Change.AbsolutePosition] = var12
		})
	end)
end