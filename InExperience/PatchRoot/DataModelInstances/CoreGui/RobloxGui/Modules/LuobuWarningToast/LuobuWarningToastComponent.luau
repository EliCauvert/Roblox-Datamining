local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local toast = UIBloxModule.App.Dialog.Toast
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local contentProviderService = game:GetService("ContentProvider")
local renderWithCoreScriptsStyleProviderModule = require(robloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local luobuWarningToastComponent = roactModule.PureComponent:extend("LuobuWarningToastComponent")
local var9 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Message.LuobuGameJoinWarning")

function luobuWarningToastComponent.init(p0)
	-- upvalues: images (ref), contentProviderService (ref), var9 (ref)
	p0.state = { isLoaded = false }
	task.spawn(function()
		-- upvalues: images (copy), contentProviderService (copy), p0 (ref)
		local image = images["icons/status/alert"].Image
		pcall(function()
			-- upvalues: contentProviderService (copy), image (ref)
			contentProviderService:PreloadAsync({ image })
		end)
		p0:setState({ isLoaded = true })
	end)
	
	function p0.getToastContent()
		-- upvalues: images (copy), var9 (copy)
		return {
			iconImage = images["icons/status/alert"],
			iconColorStyle = { Transparency = 0, Color = Color3.new(1, 1, 1) },
			toastTitle = var9
		}
	end
end

function luobuWarningToastComponent.render(p1)
	-- upvalues: roactModule (ref), toast (ref), renderWithCoreScriptsStyleProviderModule (ref)
	return if p1.state.isLoaded then renderWithCoreScriptsStyleProviderModule({
		RobloxCaptureNotificationGui = roactModule.createElement("ScreenGui", {
			AutoLocalize = false,
			DisplayOrder = 9,
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Content = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				WarningToast = roactModule.createElement(toast, {
					duration = 5,
					show = true,
					toastContent = p1.getToastContent()
				})
			})
		})
	}) else nil
end

return luobuWarningToastComponent