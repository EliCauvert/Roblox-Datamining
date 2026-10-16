local _ = require(script.Parent.common)
local _ = require(script.Parent.acpSession)

return {
	RequestFailureKind = table.freeze({
		Timeout = "timeout",
		Transport = "transport",
		Http = "http",
		RpcError = "rpc_error",
		Unknown = "unknown"
	})
}