
local lx, _M, mt = oo{
    _cls_ = ''
}

local app, lf, tb, str = lx.kit()
local rand = lf.rand

function _M:new()

    local this = {
    }

    return oo(this, mt)
end

function _M:name()

    return str.random(5)
end

function _M:email()

    return str.random(5) .. '@' .. str.random(5) .. '.com'
end

function _M:datetime()

    return lf.datetime()
end

function _M:paragraphs(count)

    local ret = {}

    for i = 1, count do
        local each = {}
        for ii = 1, lf.rand(15) do
            tapd(each, str.random(lf.rand(3,8)))
        end
        tapd(ret, str.join(each, ' ') .. '.')
    end

    return ret
end

function _M:sentence(count)

    count = count or rand(5, 10)
    local ret = {}
 
    for i = 1, count do
        tapd(ret, str.random(lf.rand(1,7)))
    end

    return str.join(ret, ' ') .. '.'
end

function _M:text()

    return self:sentence()
end

function _M:slug(var)

    return str.random(6)
end

function _M:url()

    return 'http://' .. str.random(6) .. '.com/' .. str.random(4)
end

function _M:city()

    return str.random(6)
end

function _M:userName()

    return str.random(6)
end

function _M:randomElement(arr)

    return tb.rand(arr, 1)
end

return _M

