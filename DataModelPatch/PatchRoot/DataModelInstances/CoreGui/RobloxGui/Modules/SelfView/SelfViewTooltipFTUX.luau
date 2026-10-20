local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local _ = CoreGui:WaitForChild("RobloxGui")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local PromiseModule = require(CorePackages.Packages.Promise)

return function(p1)
	-- upvalues: ReactModule (copy), RobloxTranslatorModule (copy), CoreGui (copy), TooltipOrientation (copy), UserInputService (copy), PromiseModule (copy), WithTooltipFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local FallbackText = p1.fallbackText
	pcall(function()
		-- upvalues: FallbackText (ref), RobloxTranslatorModule (upval), p1 (copy)
		FallbackText = RobloxTranslatorModule:FormatByKey(p1.translationKey)
	end)
	local config = {
		textAlignment = Enum.TextXAlignment.Left,
		bodyText = FallbackText
	}
	local config1 = {
		DisplayOrder = 10,
		active = UseStateResult,
		guiTarget = CoreGui,
		preferredOrientation = TooltipOrientation.Left
	}
	local Connection = nil
	
	local function _()
		-- upvalues: UseStateResult2 (copy), Connection (ref)
		UseStateResult2(false)
		
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
	end
	
	Connection = UserInputService.InputBegan:Connect(function(Input)
		-- upvalues: UseStateResult2 (copy), Connection (ref)
		local UserInputType = Input.UserInputType
		
		if UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch then
			UseStateResult2(false)
			
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
	end)
	PromiseModule.delay(p1.tooltipLifetime):andThen(function()
		-- upvalues: UseStateResult2 (copy), Connection (ref)
		UseStateResult2(false)
		
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
	end)
	
	return WithTooltipFunction(config, config1, function(Callback)
		-- upvalues: ReactModule (upval)
		local function v17(p2)
			-- upvalues: Callback (copy)
			Callback(p2)
		end
		
		return ReactModule.createElement("Frame", {
			Visible = false,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			[ReactModule.Change.AbsoluteSize] = v17,
			[ReactModule.Change.AbsolutePosition] = v17
		})
	end)
end