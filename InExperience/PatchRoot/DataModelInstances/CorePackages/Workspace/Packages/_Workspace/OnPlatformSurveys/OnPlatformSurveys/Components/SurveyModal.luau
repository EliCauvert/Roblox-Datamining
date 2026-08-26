local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialogSize = foundationModule.Enums.DialogSize
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local useScaledValue = foundationModule.Hooks.useScaledValue
local useSurveyFocusRefsModule = require(onPlatformSurveys.Hooks.useSurveyFocusRefs)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useScaledValue (ref), useSurveyFocusRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), sheet (ref), dialogSize (ref), text (ref), view (ref)
	local var1 = p1.isOpen ~= false
	local onClose = p1.onClose
	local var2, var3 = reactModule.useState(0)
	local var4, var5 = reactModule.useState(0)
	local var6 = (if p1.children then var2 else 0) + useScaledValue(116) + (if p1.footer then var4 else 0)
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		isOpen = var1,
		onClose = onClose,
		size = dialogSize.Large,
		centerSheetHeight = var6,
		snapPoints = reactModule.useMemo(function()
			-- upvalues: var6 (ref)
			return { var6 }
		end, { var6 }),
		ref = useSurveyFocusRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, onClose)
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = p1.title and reactModule.createElement(text, {
				tag = "fill auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
				Text = p1.title
			}) or nil
		}),
		Content = reactModule.createElement(sheet.Content, {}, {
			Body = reactModule.createElement(view, {
				tag = "col size-full-0 auto-y padding-bottom-small",
				onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
					-- upvalues: var3 (ref)
					var3(p2.AbsoluteSize.Y)
				end, {})
			}, p1.children)
		}),
		Actions = p1.footer and reactModule.createElement(sheet.Actions, {}, {
			Footer = reactModule.createElement(view, {
				tag = "row size-full-0 auto-y",
				onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
					-- upvalues: var5 (ref)
					var5(p2.AbsoluteSize.Y)
				end, {})
			}, p1.footer)
		}) or nil
	})
end)