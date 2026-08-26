local corePackagesService = game:GetService("CorePackages")
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local makeActionCreator = require(corePackagesService.Packages.Rodux).makeActionCreator
local tModule = require(corePackagesService.Packages.t)
local maybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)
local var1 = tModule.tuple(tModule.string, tModule.string)

return makeActionCreator(script.Name, function(p1, p2)
	-- upvalues: maybeAssertModule (ref), var1 (ref), expChatModule (ref)
	maybeAssertModule(var1(p1, p2))
	expChatModule.Events.LegacyBubbleTextUpdated(p1, p2)
	
	return { messageId = p1, newText = p2 }
end)