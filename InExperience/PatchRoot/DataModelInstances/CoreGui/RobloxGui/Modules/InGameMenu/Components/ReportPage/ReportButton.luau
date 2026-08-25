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
local var6 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var7 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local image = foundationModule.Image
local var8 = t.strictInterface({
	userId = t.optional(t.integer),
	userName = t.optional(t.string),
	LayoutOrder = t.integer,
	dispatchOpenReportDialog = t.callback
})

return roactRodux.UNSTABLE_connect2(nil, function(p2)
	-- upvalues: openReportDialogModule (ref)
	return {
		dispatchOpenReportDialog = function(p3, p4)
			-- upvalues: p2 (ref), openReportDialogModule (copy)
			p2(openReportDialogModule(p3, p4))
		end
	}
end)(function(p0)
	-- upvalues: globalConfigModule (ref), var8 (ref), var6 (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), roact (ref), image (ref), assetsModule (ref), var7 (ref), imageSetButton (ref)
	if globalConfigModule.propValidation then
		assert(var8(p0))
	end
	return var6(function(p1)
		-- upvalues: fFlagCoreUiMigrateUIBloxToFoundation (copy), roact (copy), image (copy), assetsModule (copy), p0 (ref), var7 (copy), imageSetButton (copy)
		return if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			Image = assetsModule.Images.ReportIcon,
			Size = UDim2.new(0, 36, 0, 36),
			backgroundStyle = { Transparency = 1 },
			imageStyle = { Transparency = 0, Color3 = Color3.fromRGB(255, 255, 255) },
			LayoutOrder = p0.LayoutOrder,
			selection = {
				Selectable = false,
				SelectionImageObject = p1(var7.RoundedRectNoInset)
			},
			onActivated = function()
				-- upvalues: p0 (copy)
				p0.dispatchOpenReportDialog(p0.userId, p0.userName)
			end
		}) else roact.createElement(imageSetButton, {
			Selectable = false,
			Image = assetsModule.Images.ReportIcon,
			Size = UDim2.new(0, 36, 0, 36),
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			LayoutOrder = p0.LayoutOrder,
			SelectionImageObject = p1(var7.RoundedRectNoInset),
			[roact.Event.Activated] = function()
				-- upvalues: p0 (copy)
				p0.dispatchOpenReportDialog(p0.userId, p0.userName)
			end
		})
	end)
end)