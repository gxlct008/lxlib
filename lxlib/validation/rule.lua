
local lx, _M, mt = oo{
    _cls_ = ''
}

local app, lf, tb, str = lx.kit()

function _M:dimensions(constraints)

    constraints = constraints or {}
    
    return new('lxlib.validation.rules.dimensions', constraints)
end

function _M:exists(table, column)

    column = column or 'NULL'
    
    return new('lxlib.validation.rules.exists', table, column)
end

function _M:in(values)

    return new('lxlib.validation.rules.in', values)
end

function _M:notIn(values)

    return new('lxlib.validation.rules.notIn', values)
end

function _M:unique(table, column)

    column = column or 'null'
    
    return new('lxlib.validation.rules.unique', table, column)
end

return _M

