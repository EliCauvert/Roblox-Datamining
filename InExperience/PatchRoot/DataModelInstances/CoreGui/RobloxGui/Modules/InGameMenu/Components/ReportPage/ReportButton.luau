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
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local Image = FoundationModule.Image
local StrictInterfaceResult = T.strictInterface({
	userId = T.optional(T.integer),
	userName = T.optional(T.string),
	LayoutOrder = T.integer,
	dispatchOpenReportDialog = T.callback
})

return InGameMenuDependenciesModule.RoactRodux.UNSTABLE_connect2(nil, function(Callback) --[[ Line: 78 ]]
	-- upvalues: OpenReportDialogModule (copy)
	return {
		dispatchOpenReportDialog = function(UserId, UserName) --[[ Line: 80 ]]
			-- upvalues: Callback (copy), OpenReportDialogModule (upval)
			Callback(OpenReportDialogModule(UserId, UserName))
		end
	}
end)(function(Frame: Frame) --[[ Line: 37 | Named "ReportButton" ]]
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithCursorMigration (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Roact (copy), Image (copy), AssetsModule (copy), CursorType (copy), ImageSetButton (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(Frame))
	end
	return WithCursorMigration(function(Callback) --[[ Line: 42 ]]
		-- upvalues: FFlagCoreUiMigrateUIBloxToFoundation (upval), Roact (upval), Image (upval), AssetsModule (upval), Frame (copy), CursorType (upval), ImageSetButton (upval)
		return if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
			Image = AssetsModule.Images.ReportIcon,
			Size = UDim2.new(0, 36, 0, 36),
			backgroundStyle = { Transparency = 1 },
			imageStyle = { Transparency = 0, Color3 = Color3.fromRGB(255, 255, 255) },
			LayoutOrder = Frame.LayoutOrder,
			selection = {
				Selectable = false,
				SelectionImageObject = Callback(CursorType.RoundedRectNoInset)
			},
			onActivated = function() --[[ Line: 57 ]]
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
			SelectionImageObject = Callback(CursorType.RoundedRectNoInset),
			[Roact.Event.Activated] = function() --[[ Line: 70 ]]
				-- upvalues: Frame (upval)
				Frame.dispatchOpenReportDialog(Frame.userId, Frame.userName)
			end
		})
	end)
end)