#include <string>
#include "wrap.h"
#include "tins/ip_address.h"
#include "tins/hw_address.h"

namespace Tins {
    uint32_t convert_to_big_endian_int (IPv4Address& addr) {
        return (uint32_t)addr;
    }
    bool network_interface_to_bool(const NetworkInterface& nwi) {
        return bool(nwi);
    }

    PDU* cpp_find_pdu(const PDU* pdu, PDU::PDUType t) {
        PDU* current_pdu = (PDU*) pdu;
        while(current_pdu) {
            if(current_pdu->matches_flag(t))
                return current_pdu;
            current_pdu = current_pdu->inner_pdu();
        }
        return 0;
    }

    WrappedIPv4Range& WrappedIPv4Range::operator=(const WrappedIPv4Range& r) {
        IPv4Range::operator=(r);
        return *this;
    }

    WrappedIPv4Range& WrappedIPv4Range::operator=(const IPv4Range& r) {
        IPv4Range::operator=(r);
        return *this;
    }

    WrappedIPv6Range& WrappedIPv6Range::operator=(const WrappedIPv6Range& r) {
        IPv6Range::operator=(r);
        return *this;
    }

    WrappedIPv6Range& WrappedIPv6Range::operator=(const IPv6Range& r) {
        IPv6Range::operator=(r);
        return *this;
    }

    WrappedHWRange& WrappedHWRange::operator=(const WrappedHWRange& r) {
        HWAddressRange::operator=(r);
        return *this;
    }

    WrappedHWRange& WrappedHWRange::operator=(const HWAddressRange& r) {
        HWAddressRange::operator=(r);
        return *this;
    }

}
