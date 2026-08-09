local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local restoreVersionDialogModule = require(script.Parent.RestoreVersionDialog)
local versionHistoryCardModule = require(script.Parent.VersionHistoryCard)
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View

return function(p0) --[[ line: 36 | named "VersionHistoryBottomSheet" ]]
	-- upvalues: reactModule (ref), versionHistoryCardModule (ref), sheet (ref), text (ref), view (ref), restoreVersionDialogModule (ref)
	local testId = p0.testId or "version-history-bottom-sheet"
	local var5, var6 = reactModule.useState(nil)
	local var7 = reactModule.useCallback(function(p1) --[[ line: 45 ]]
		-- upvalues: var6 (ref)
		var6(p1)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Sheet = reactModule.createElement(sheet.Root, {
			defaultSnapPointIndex = 2,
			isOpen = p0.isOpen == nil or p0.isOpen,
			snapPoints = { 0.5, 1 },
			onClose = reactModule.useCallback(function() --[[ line: 40 ]]
				-- upvalues: var6 (ref), p0 (ref)
				var6(nil)
				p0.onClose()
			end, { p0.onClose }),
			testId = testId
		}, {
			Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					Text = "Version History",
					tag = "auto-xy text-heading-small text-truncate-end content-emphasis"
				})
			}),
			Content = reactModule.createElement(sheet.Content, nil, {
				Status = if p0.statusText then reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-bottom-medium text-body-medium text-wrap text-align-x-left content-default",
					Text = p0.statusText
				}) else nil,
				Cards = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "col gap-medium size-full-0 auto-y padding-bottom-large"
				}, reactModule.useMemo(function() --[[ line: 60 ]]
					-- upvalues: p0 (ref), testId (ref), reactModule (copy), versionHistoryCardModule (copy), var7 (ref)
					local t = {}
					
					for i, v in p0.entries do
						t[v.id] = reactModule.createElement(versionHistoryCardModule, {
							layoutOrder = i,
							versionLabel = v.versionLabel,
							title = v.title,
							description = v.description,
							badgeText = v.badgeText,
							isRestoreDisabled = p0.isRestoreDisabled,
							onRestore = function() --[[ line: 71 ]]
								-- upvalues: var7 (copy), v (ref)
								var7(v)
							end,
							testId = `{testId}-card-{v.id}`
						})
					end
					return t
				end, { p0.entries, p0.isRestoreDisabled, var7, testId }))
			})
		}),
		RestoreDialog = if var5 then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			title = var5.versionLabel,
			description = var5.description,
			onRestore = reactModule.useCallback(function() --[[ line: 53 ]]
				-- upvalues: var5 (ref), p0 (ref), var6 (ref)
				if var5 and not p0.isRestoreDisabled then
					p0.onRestore(var5)
				end
				var6(nil)
			end, { var5, p0.isRestoreDisabled, p0.onRestore }),
			onCancel = reactModule.useCallback(function() --[[ line: 49 ]]
				-- upvalues: var6 (ref)
				var6(nil)
			end, {}),
			testId = `{testId}-restore-dialog`
		}) else nil
	})
end