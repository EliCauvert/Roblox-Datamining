local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local Toast = UIBloxModule.App.Dialog.Toast
local ContentProvider = game:GetService("ContentProvider")
local RenderWithCoreScriptsStyleProviderModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.renderWithCoreScriptsStyleProvider)
local LuobuWarningToastComponent = RoactModule.PureComponent:extend("LuobuWarningToastComponent")
local InGameCommonUIMessageLuobuGameJoinWarning = require(CorePackages.Workspace.Packages.RobloxTranslator):FormatByKey("InGame.CommonUI.Message.LuobuGameJoinWarning")

function LuobuWarningToastComponent.init(p1)
	-- upvalues: Images (copy), ContentProvider (copy), InGameCommonUIMessageLuobuGameJoinWarning (copy)
	p1.state = { isLoaded = false }
	task.spawn(function()
		-- upvalues: Images (upval), ContentProvider (upval), p1 (copy)
		local Image = Images["icons/status/alert"].Image
		pcall(function()
			-- upvalues: ContentProvider (upval), Image (copy)
			ContentProvider:PreloadAsync({ Image })
		end)
		p1:setState({ isLoaded = true })
	end)
	
	function p1.getToastContent()
		-- upvalues: Images (upval), InGameCommonUIMessageLuobuGameJoinWarning (upval)
		return {
			iconImage = Images["icons/status/alert"],
			iconColorStyle = { Transparency = 0, Color = Color3.new(1, 1, 1) },
			toastTitle = InGameCommonUIMessageLuobuGameJoinWarning
		}
	end
end

function LuobuWarningToastComponent.render(p1)
	-- upvalues: RoactModule (copy), Toast (copy), RenderWithCoreScriptsStyleProviderModule (copy)
	return if p1.state.isLoaded then RenderWithCoreScriptsStyleProviderModule({
		RobloxCaptureNotificationGui = RoactModule.createElement("ScreenGui", {
			AutoLocalize = false,
			DisplayOrder = 9,
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Content = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				WarningToast = RoactModule.createElement(Toast, {
					duration = 5,
					show = true,
					toastContent = p1.getToastContent()
				})
			})
		})
	}) else nil
end

return LuobuWarningToastComponent