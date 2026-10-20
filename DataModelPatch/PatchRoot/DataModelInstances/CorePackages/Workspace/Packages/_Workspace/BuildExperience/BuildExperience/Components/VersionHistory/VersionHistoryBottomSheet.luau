local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RestoreVersionDialogModule = require(script.Parent.RestoreVersionDialog)
local VersionHistoryCardModule = require(script.Parent.VersionHistoryCard)
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), VersionHistoryCardModule (copy), Sheet (copy), Text (copy), View (copy), RestoreVersionDialogModule (copy)
	local TestId = p1.testId or "version-history-bottom-sheet"
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), p1 (copy), UseStateResult2 (copy)
		if UseStateResult and not p1.isRestoreDisabled then
			p1.onRestore(UseStateResult)
		end
		UseStateResult2(nil)
	end, { UseStateResult, p1.isRestoreDisabled, p1.onRestore })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Sheet = ReactModule.createElement(Sheet.Root, {
			defaultSnapPointIndex = 2,
			isOpen = p1.isOpen == nil or p1.isOpen,
			snapPoints = { 0.5, 1 },
			onClose = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy), p1 (copy)
				UseStateResult2(nil)
				p1.onClose()
			end, { p1.onClose }),
			testId = TestId
		}, {
			Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					Text = "Version History",
					tag = "auto-xy text-heading-small text-truncate-end content-emphasis"
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, { scrollingFrameRef = p1.scrollingFrameRef }, {
				Status = if p1.statusText then ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-bottom-medium text-body-medium text-wrap text-align-x-left content-default",
					Text = p1.statusText
				}) else nil,
				Cards = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "col gap-medium size-full-0 auto-y padding-bottom-large"
				}, (ReactModule.useMemo(function()
					-- upvalues: p1 (copy), TestId (copy), ReactModule (upval), VersionHistoryCardModule (upval), UseResult (copy)
					local Elements = {}
					
					for LayoutOrder, entry in p1.entries do
						Elements[entry.id] = ReactModule.createElement(VersionHistoryCardModule, {
							layoutOrder = LayoutOrder,
							versionLabel = entry.versionLabel,
							title = entry.title,
							description = entry.description,
							badgeText = entry.badgeText,
							isRestoreDisabled = p1.isRestoreDisabled,
							onRestore = function()
								-- upvalues: UseResult (upval), entry (copy)
								UseResult(entry)
							end,
							testId = `{TestId}-card-{entry.id}`
						})
					end
					return Elements
				end, { p1.entries, p1.isRestoreDisabled, UseResult, TestId })))
			})
		}),
		RestoreDialog = if UseStateResult then ReactModule.createElement(RestoreVersionDialogModule, {
			isOpen = true,
			title = UseStateResult.versionLabel,
			description = UseStateResult.description,
			onRestore = UseResult2,
			onCancel = UseResult1,
			testId = `{TestId}-restore-dialog`
		}) else nil
	})
end