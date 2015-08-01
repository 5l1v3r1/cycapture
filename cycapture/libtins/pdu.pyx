# -*- coding: utf-8 -*-
"""
Abstract PDU python class
"""
# noinspection PyUnresolvedReferences
from libc.stdint cimport uint16_t, uint32_t, uint8_t

cdef class PDU(object):
    RAW = PDU_RAW
    ETHERNET_II = PDU_ETHERNET_II
    IEEE802_3 = PDU_IEEE802_3
    RADIOTAP = PDU_RADIOTAP
    DOT11 = PDU_DOT11
    DOT11_ACK = PDU_DOT11_ACK
    DOT11_ASSOC_REQ = PDU_DOT11_ASSOC_REQ
    DOT11_ASSOC_RESP = PDU_DOT11_ASSOC_RESP
    DOT11_AUTH = PDU_DOT11_AUTH
    DOT11_BEACON = PDU_DOT11_BEACON
    DOT11_BLOCK_ACK = PDU_DOT11_BLOCK_ACK
    DOT11_BLOCK_ACK_REQ = PDU_DOT11_BLOCK_ACK_REQ
    DOT11_CF_END = PDU_DOT11_CF_END
    DOT11_DATA = PDU_DOT11_DATA
    DOT11_CONTROL = PDU_DOT11_CONTROL
    DOT11_DEAUTH = PDU_DOT11_DEAUTH
    DOT11_DIASSOC = PDU_DOT11_DIASSOC
    DOT11_END_CF_ACK = PDU_DOT11_END_CF_ACK
    DOT11_MANAGEMENT = PDU_DOT11_MANAGEMENT
    DOT11_PROBE_REQ = PDU_DOT11_PROBE_REQ
    DOT11_PROBE_RESP = PDU_DOT11_PROBE_RESP
    DOT11_PS_POLL = PDU_DOT11_PS_POLL
    DOT11_REASSOC_REQ = PDU_DOT11_REASSOC_REQ
    DOT11_REASSOC_RESP = PDU_DOT11_REASSOC_RESP
    DOT11_RTS = PDU_DOT11_RTS
    DOT11_QOS_DATA = PDU_DOT11_QOS_DATA
    LLC = PDU_LLC
    SNAP = PDU_SNAP
    IP = PDU_IP
    ARP = PDU_ARP
    TCP = PDU_TCP
    UDP = PDU_UDP
    ICMP = PDU_ICMP
    BOOTP = PDU_BOOTP
    DHCP = PDU_DHCP
    EAPOL = PDU_EAPOL
    RC4EAPOL = PDU_RC4EAPOL
    RSNEAPOL = PDU_RSNEAPOL
    DNS = PDU_DNS
    LOOPBACK = PDU_LOOPBACK
    IPv6 = PDU_IPv6
    ICMPv6 = PDU_ICMPv6
    SLL = PDU_SLL
    DHCPv6 = PDU_DHCPv6
    DOT1Q = PDU_DOT1Q
    PPPOE = PDU_PPPOE
    STP = PDU_STP
    PPI = PDU_PPI
    IPSEC_AH = PDU_IPSEC_AH
    IPSEC_ESP = PDU_IPSEC_ESP
    PKTAP = PDU_PKTAP
    USER_DEFINED_PDU = PDU_USER_DEFINED_PDU


    property header_size:
        def __get__(self):
            return int(self.base_ptr.header_size())

    property trailer_size:
        def __get__(self):
            return int(self.base_ptr.trailer_size())

    cpdef serialize(self):
        cdef vector[uint8_t] v = self.base_ptr.serialize()
        cdef uint8_t* p = &v[0]
        return <bytes> (p[:v.size()])
