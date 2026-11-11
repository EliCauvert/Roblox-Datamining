local OmniFeedService = {}
OmniFeedService.__index = OmniFeedService

function OmniFeedService.get()
	-- upvalues: OmniFeedService (copy)
	if not OmniFeedService.default then
		local Default = {}
		setmetatable(Default, OmniFeedService)
		OmniFeedService.default = Default
	end
	return OmniFeedService.default
end

function OmniFeedService.initialize(p1, _omniFeedItemMap)
	if not p1._omniFeedItemMap then
		p1._omniFeedItemMap = _omniFeedItemMap
		
		return
	end
	if not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
		warn("OmniFeedService already initialized with an item map.  Ignoring.")
	end
end

function OmniFeedService.getOmniFeedItemMap(p1)
	if not p1._omniFeedItemMap then
		error("OmniFeedService was never initialized with a proper item map. Make sure that OmniFeedService:initialize is called before being accessed.")
	end
	return p1._omniFeedItemMap
end

return OmniFeedService