local ConstantsModule = require(script.Common.Constants)
local _ = require(script.Common.Types)

return {
	["jest.config"] = script["jest.config"],
	RoduxKey = ConstantsModule.RODUX_KEY,
	DefaultPrimaryCtaMinWidth = ConstantsModule.DEFAULT_PRIMARY_CTA_MIN_WIDTH,
	DefaultPrimaryCtaMaxWidth = ConstantsModule.DEFAULT_PRIMARY_CTA_MAX_WIDTH,
	installReducer = require(script.Rodux.installReducer),
	Components = require(script.Deprecated).Components,
	Enums = require(script.Common.Enums),
	UserListHeader = require(script.Components).UserListHeader,
	UserListFooter = require(script.Components).UserListFooter,
	UserListLayoutAdaptor = require(script.Components).UserListLayoutAdaptor,
	UserRow = require(script.Components).UserRow,
	EntityRow = require(script.Components).EntityRow,
	VerticalUserList = require(script.Components).VerticalUserList,
	HorizontalUserList = require(script.Components).HorizontalUserList,
	ContactsContext = require(script.Context).ContactsContext
}