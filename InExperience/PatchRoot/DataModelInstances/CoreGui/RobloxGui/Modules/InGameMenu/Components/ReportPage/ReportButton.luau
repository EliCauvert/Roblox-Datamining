local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local parent = script.Parent.Parent.Parent
local globalConfigModule = require(parent.GlobalConfig)
local assetsModule = require(parent.Resources.Assets)
local openReportDialogModule = require(parent.Actions.OpenReportDialog)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local var4 = t.strictInterface({
	userId = t.optional(t.integer),
	userName = t.optional(t.string),
	LayoutOrder = t.integer,
	dispatchOpenReportDialog = t.callback
})

return roactRodux.UNSTABLE_connect2(nil, function(p2) --[[ line: 49 ]]
	-- upvalues: openReportDialogModule (ref)
	return {
		dispatchOpenReportDialog = function(p3, p4) --[[ line: 51 ]]
			-- upvalues: p2 (ref), openReportDialogModule (copy)
			p2(openReportDialogModule(p3, p4))
		end
	}
end)(function(p0) --[[ line: 28 | named "ReportButton" ]]
	-- upvalues: globalConfigModule (ref), var4 (ref), withSelectionCursorProvider (ref), roact (ref), imageSetButton (ref), assetsModule (ref), cursorKind (ref)
	if globalConfigModule.propValidation then
		assert(var4(p0))
	end
	return withSelectionCursorProvider(function(p1) --[[ line: 33 ]]
		-- upvalues: roact (copy), imageSetButton (copy), assetsModule (copy), p0 (ref), cursorKind (copy)
		return roact.createElement(imageSetButton, {
			Selectable = false,
			Image = assetsModule.Images.ReportIcon,
			Size = UDim2.new(0, 36, 0, 36),
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			LayoutOrder = p0.LayoutOrder,
			SelectionImageObject = p1(cursorKind.RoundedRectNoInset),
			[roact.Event.Activated] = function() --[[ line: 42 ]]
				-- upvalues: p0 (copy)
				p0.dispatchOpenReportDialog(p0.userId, p0.userName)
			end
		})
	end)
end)