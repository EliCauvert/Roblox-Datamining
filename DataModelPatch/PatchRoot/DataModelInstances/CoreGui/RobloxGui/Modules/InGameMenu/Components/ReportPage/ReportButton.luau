local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Parent = script.Parent.Parent.Parent
local GlobalConfigModule = require(Parent.GlobalConfig)
local AssetsModule = require(Parent.Resources.Assets)
local OpenReportDialogModule = require(Parent.Actions.OpenReportDialog)
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local WithSelectionCursorProviderFunction = UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBlox.App.SelectionImage.CursorKind
local Image = require(CorePackages.Packages.Foundation).Image
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local StrictInterfaceResult = T.strictInterface({
	userId = T.optional(T.integer),
	userName = T.optional(T.string),
	LayoutOrder = T.integer,
	dispatchOpenReportDialog = T.callback
})

return InGameMenuDependenciesModule.RoactRodux.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: OpenReportDialogModule (copy)
	return {
		dispatchOpenReportDialog = function(UserId, UserName)
			-- upvalues: Callback (copy), OpenReportDialogModule (upval)
			Callback(OpenReportDialogModule(UserId, UserName))
		end
	}
end)(function(Frame: Frame)
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithSelectionCursorProviderFunction (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Roact (copy), Image (copy), AssetsModule (copy), CursorKind (copy), ImageSetButton (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(Frame))
	end
	return WithSelectionCursorProviderFunction(function(Callback)
		-- upvalues: FFlagCoreUiMigrateUIBloxToFoundation (upval), Roact (upval), Image (upval), AssetsModule (upval), Frame (copy), CursorKind (upval), ImageSetButton (upval)
		return if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
			Image = AssetsModule.Images.ReportIcon,
			Size = UDim2.new(0, 36, 0, 36),
			imageStyle = { Transparency = 0, Color3 = Color3.fromRGB(255, 255, 255) },
			LayoutOrder = Frame.LayoutOrder,
			selection = {
				Selectable = false,
				SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
			},
			onActivated = function()
				-- upvalues: Frame (upval)
				Frame.dispatchOpenReportDialog(Frame.userId, Frame.userName)
			end
		}) else Roact.createElement(ImageSetButton, {
			Selectable = false,
			Image = AssetsModule.Images.ReportIcon,
			Size = UDim2.new(0, 36, 0, 36),
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			LayoutOrder = Frame.LayoutOrder,
			SelectionImageObject = Callback(CursorKind.RoundedRectNoInset),
			[Roact.Event.Activated] = function()
				-- upvalues: Frame (upval)
				Frame.dispatchOpenReportDialog(Frame.userId, Frame.userName)
			end
		})
	end)
end)