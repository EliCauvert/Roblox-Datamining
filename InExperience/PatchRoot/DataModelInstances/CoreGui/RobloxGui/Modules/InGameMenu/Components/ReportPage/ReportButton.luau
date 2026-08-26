local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local parent = script.Parent.Parent.Parent
local globalConfigModule = require(parent.GlobalConfig)
local assetsModule = require(parent.Resources.Assets)
local openReportDialogModule = require(parent.Actions.OpenReportDialog)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local image = foundationModule.Image
local var3 = t.strictInterface({
	userId = t.optional(t.integer),
	userName = t.optional(t.string),
	LayoutOrder = t.integer,
	dispatchOpenReportDialog = t.callback
})

return roactRodux.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: openReportDialogModule (ref)
	return {
		dispatchOpenReportDialog = function(p2, p3)
			-- upvalues: p1 (ref), openReportDialogModule (copy)
			p1(openReportDialogModule(p2, p3))
		end
	}
end)(function(p1)
	-- upvalues: globalConfigModule (ref), var3 (ref), var1 (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), roact (ref), image (ref), assetsModule (ref), var2 (ref), imageSetButton (ref)
	if globalConfigModule.propValidation then
		assert(var3(p1))
	end
	return var1(function(p2)
		-- upvalues: fFlagCoreUiMigrateUIBloxToFoundation (copy), roact (copy), image (copy), assetsModule (copy), p1 (ref), var2 (copy), imageSetButton (copy)
		return if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			Image = assetsModule.Images.ReportIcon,
			Size = UDim2.new(0, 36, 0, 36),
			backgroundStyle = { Transparency = 1 },
			imageStyle = { Transparency = 0, Color3 = Color3.fromRGB(255, 255, 255) },
			LayoutOrder = p1.LayoutOrder,
			selection = {
				Selectable = false,
				SelectionImageObject = p2(var2.RoundedRectNoInset)
			},
			onActivated = function()
				-- upvalues: p1 (copy)
				p1.dispatchOpenReportDialog(p1.userId, p1.userName)
			end
		}) else roact.createElement(imageSetButton, {
			Selectable = false,
			Image = assetsModule.Images.ReportIcon,
			Size = UDim2.new(0, 36, 0, 36),
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			LayoutOrder = p1.LayoutOrder,
			SelectionImageObject = p2(var2.RoundedRectNoInset),
			[roact.Event.Activated] = function()
				-- upvalues: p1 (copy)
				p1.dispatchOpenReportDialog(p1.userId, p1.userName)
			end
		})
	end)
end)