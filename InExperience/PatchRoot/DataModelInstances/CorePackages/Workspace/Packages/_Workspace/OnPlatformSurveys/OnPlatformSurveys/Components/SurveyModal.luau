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

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), useScaledValue (ref), useSurveyFocusRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), sheet (ref), dialogSize (ref), text (ref), view (ref)
	local var5 = p0.isOpen ~= false
	local onClose = p0.onClose
	local var6, var7 = reactModule.useState(0)
	local var8, var9 = reactModule.useState(0)
	local var10 = (if p0.children then var6 else 0) + useScaledValue(116) + (if p0.footer then var8 else 0)
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		isOpen = var5,
		onClose = onClose,
		size = dialogSize.Large,
		centerSheetHeight = var10,
		snapPoints = reactModule.useMemo(function()
			-- upvalues: var10 (ref)
			return { var10 }
		end, { var10 }),
		ref = useSurveyFocusRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, onClose)
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = p0.title and reactModule.createElement(text, {
				tag = "fill auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
				Text = p0.title
			}) or nil
		}),
		Content = reactModule.createElement(sheet.Content, {}, {
			Body = reactModule.createElement(view, {
				tag = "col size-full-0 auto-y padding-bottom-small",
				onAbsoluteSizeChanged = reactModule.useCallback(function(p1)
					-- upvalues: var7 (ref)
					var7(p1.AbsoluteSize.Y)
				end, {})
			}, p0.children)
		}),
		Actions = p0.footer and reactModule.createElement(sheet.Actions, {}, {
			Footer = reactModule.createElement(view, {
				tag = "row size-full-0 auto-y",
				onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
					-- upvalues: var9 (ref)
					var9(p2.AbsoluteSize.Y)
				end, {})
			}, p0.footer)
		}) or nil
	})
end)